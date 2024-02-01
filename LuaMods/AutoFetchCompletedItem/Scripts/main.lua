local UEHelpers = require("UEHelpers")
local hooked = false
local IgnoreMetal=false
local IgnoreCake=true
local inited=false
--这个b函数在上下马时也会触发
RegisterHook("/Script/Engine.PlayerController:ClientRestart", function(Context)
    if not inited then
        inited=true
        PlayerController=UEHelpers.GetPlayerController()
        PalPlayerState=PlayerController:GetPalPlayerState()
        PalNetworkPlayerComponent=PlayerController["Transmitter"]:GetPlayer()
        PalUtility = StaticFindObject("/Script/Pal.Default__PalUtility")
        if not hooked then
            hooked=true
            ExecuteWithDelay(5000,function()
                ExecuteInGameThread(function()
                    RegisterHook("/Game/Pal/Blueprint/UI/UserInterface/ESCMenu/WBP_MenuESC.WBP_MenuESC_C:OnReturn2Title",function()
                        inited=false
                    end)
                end)
            end)
            
            RegisterHook("/Script/Pal.PalMapObjectConvertItemModel:OnEndWorkAnyone_ServerInternal", function(Context)    
                if PalUtility == nil or not Context:get()["IsPickUpInteractable"] then
                    return
                end
                local tmpModel=Context:get()
                --print(tostring(Context:get():GetRemainCreateNum()))
                -- when the work is finished, GetRemainCreateNum is still 1 and slot might be empty,need to wait 
                if(Context:get():GetRemainCreateNum()>1) then
                    return
                end
                print("[AutoFetch]Hook PalMapObjectConvertItemModel:OnFinishWorkInServer")
                local slot=Context:get():GetProductSlot()
                --wait for slot to be filled
                --too slow,need async
                ExecuteWithDelay(1000,function()
                    -- only fetch when all done
                    if(tmpModel:GetRemainCreateNum()>0) then
                        return
                    end
                    if slot ~= nil and slot:GetStackCount()>0  then
                        if IgnoreCake and slot:GetItemId()["StaticId"]:ToString()=="Cake" then
                            return
                        end
                        if IgnoreMetal and slot:GetItemId()["StaticId"]:ToString()=="CopperIngot" then
                            return
                        end
                        if IgnoreMetal and slot:GetItemId()["StaticId"]:ToString()=="IronIngot" then
                            return
                        end
                        --find empty slot
                        local out={}
                        PalPlayerState:GetInventoryData():TryGetContainerFromInventoryType(0,out)
                        -- There is a game bug,if requestMoveItemToInventory when bag is full, the item will stuck until restart.So need to check empry slot first.
                        local emptySlot=false
                        local num=out.OutContainer:Num()
                        --this for-block is fucking slow!
                        for i=0,num-1 do -- Container.Get() index start from 0;Tarray index start from 1
                            if out.OutContainer:Get(i):IsEmpty() then 
                                emptySlot=true
                                break
                            end
                        end
                        --CopperIngot
                        --
                        local success_message=string.format("[AutoFetch]Fetch %s x %d\r",slot:GetItemId()["StaticId"]:ToString(),slot:GetStackCount())
                        local fail_message=string.format("[AutoFetch]Ignore %s because bag is full\r",slot:GetItemId()["StaticId"]:ToString())
                        if emptySlot then
                            --RequestMoveItemToInventoryFromSlot must run in GameThread? otherwise will cause crash when quit and restart a game?
                            ExecuteInGameThread(function()
                                PalNetworkPlayerComponent:RequestMoveItemToInventoryFromSlot(slot,false)
                                if slot:IsEmpty() then --success
                                    PalUtility:SendSystemAnnounce(PlayerController, success_message)
                                    print(success_message)
                                else
                                    --fail because bag is full
                                    PalUtility:SendSystemAnnounce(PlayerController, fail_message)
                                    print(fail_message)
                                end
                            end)
                        else
                            PalUtility:SendSystemAnnounce(PlayerController, fail_message)
                            print(fail_message)
                        end
                    end
                    return
                end)
            end)
        end
    end
end)
