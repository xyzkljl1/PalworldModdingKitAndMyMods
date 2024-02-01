targetSlots=199

local hooked=false
local inited=false
manager=nil

RegisterHook("/Script/Engine.PlayerController:ClientRestart", function(Context)
    if not hooked then
        hooked=true
        ExecuteWithDelay(5000,function()
            ExecuteInGameThread(function()
                RegisterHook("/Game/Pal/Blueprint/UI/UserInterface/ESCMenu/WBP_MenuESC.WBP_MenuESC_C:OnReturn2Title",function()
                    inited=false
                    manager=nil
                end)
            end)
        end)
    end

    if not inited then
        inited=true
        --需要等待各种object加载
        ExecuteWithDelay(6000,function()
            ExecuteInGameThread(function ()
                print("[BiggerChest]Start Init")
                MyMod=StaticFindObject("/Game/Mods/BiggerChest/ModActor.Default__ModActor_C")
                manager=FindFirstOf("PalMapObjectManager")
                DoIt()
            end)
        end)
    end
end)

RegisterHook("/Script/Pal.PalBuildProcess:OnFinishWorkInServer",function(self,Work)
    DoIt()
end)

function DoIt()
    if manager~=nil and manager:IsValid() then
        MyMod:ExpandAllChests(manager,targetSlots)
    end
end