local mySpecialContainer=nil
local mySpecialNumber=237

local ModelName="PalMapObjectItemChestModel"
local ResultIndex=1
local hooked=false
local inited=false
local manager=nil
if true then
RegisterHook("/Script/Engine.PlayerController:ClientRestart", function(Context)
    if not hooked then
        hooked=true
        ExecuteWithDelay(5000,function()
            ExecuteInGameThread(function()
                RegisterHook("/Game/Pal/Blueprint/UI/UserInterface/ESCMenu/WBP_MenuESC.WBP_MenuESC_C:OnReturn2Title",function()
                    inited=false
                end)
            end)
        end)
    end

    if not inited then
        inited=true
        mySpecialContainer=nil
        --需要等待各种object加载
        ExecuteWithDelay(6000,function()
            ExecuteInGameThread(function ()
                print("[ShareChest]Start Init")
                MyMod=StaticFindObject("/Game/Mods/ShareChest/ModActor.Default__ModActor_C")
                --mySpecialContainer=nil
                --初始化
                mySpecialContainer=InitSpecialContainer(mySpecialNumber,true)
                if CheckInit() then
                    mySpecialContainer["CorruptionMultiplier"]=0.01
                    --种种原因(如箱子被攻击破坏导致Container销毁)使得一些箱子的Container为空，在启动时自动修复
                    RecoverSpecialContainerToAllChests()
                    --自动合并空箱
                    MergeEmptyChestToSpecial()
                end
            end)
        end)
    end
end)
--任意建筑完成时尝试合并空箱子(直接造完的如木地板不会触发)
--如果在拆除模式内触发该函数，产生了新的Container不为空的箱子，再将其拆除，会导致SpecialContainer销毁；忽略这个问题
RegisterHook("/Script/Pal.PalBuildProcess:OnFinishWorkInServer",function(self,Work)
    --如果建筑完成时CheckInit=false,说明此前可能没有任何备选的SpecialContainer
    --此时尝试查找箱子并将其升格为SpecialContainer1
    --这种情况可能是之前箱子被攻击破坏造成的，此时可能会有Container为空的箱子，尝试修复
    if not CheckInit() then
         mySpecialContainer=InitSpecialContainer(mySpecialNumber,false)
         if CheckInit() then
             mySpecialContainer["CorruptionMultiplier"]=0.01
             RecoverSpecialContainerToAllChests()
         end
    end
    MergeEmptyChestToSpecial()   
end)

--拆除模式时把容器的Container设为空以避免销毁容器
RegisterHook("/Script/Pal.PalUIDismantlingModel:Setup",function()
    RemoveSpecialContainerFromAllChests()
end)
RegisterHook("/Script/Pal.PalUIDismantlingModel:FinishDismantling",function()
    RecoverSpecialContainerToAllChests()
end)

function MergeEmptyChestToSpecial()
    if CheckInit() then 
        --use bp mod,faster 
        manager=FindFirstOf("PalMapObjectManager")
        --print(tostring(manager:GetFullName()))
        if manager~=nil and manager:IsValid() then
            MyMod:MergeEmptyChestToSpecial(manager,mySpecialNumber,mySpecialContainer,ModelName)
        end
        --[[
        if false then
            chestmodel=FindAllOf(ModelName)
            print(string.format("[ShareChest]Searching Chest %d",#chestmodel))
            for i=1,#chestmodel do
                if chestmodel[i]:GetItemContainerModule():IsValid() then
                    local container=chestmodel[i]:GetItemContainerModule():GetContainer()
                    if container ~=nil and container:IsValid() and container:IsEmpty() and container:Num() ~= mySpecialNumber then
                        chestmodel[i]:GetItemContainerModule()["TargetContainer"]=mySpecialContainer
                        print(string.format("[ShareChest]Merge Empty Chest"))
                    end
                end
            end
        end 
        ]]---
    end
end

function CheckInit()
    if mySpecialContainer == nil or not mySpecialContainer:IsValid() or not mySpecialContainer:IsA("/Script/Pal.PalItemContainer") then
        return false
    end
    return true
end

function RemoveSpecialContainerFromAllChests()
    if CheckInit() then   
        --use bp mod,faster 
        manager=FindFirstOf("PalMapObjectManager")
        --print(tostring(manager:GetFullName()))
        if manager~=nil and manager:IsValid() then
            MyMod:RemoveSpecialContainerFromAllChests(manager,mySpecialContainer,ModelName)
        end
        --[[
        chestmodel=FindAllOf(ModelName)
        if chestmodel~=nil then
            print(string.format("[ShareChest]Searching Chest %d",#chestmodel))
            for i=1,#chestmodel do
                if chestmodel[i]:GetItemContainerModule():IsValid() then
                    local container=chestmodel[i]:GetItemContainerModule():GetContainer()
                    if container ~=nil and container:IsValid() and container:GetFullName()==mySpecialContainer:GetFullName() then
                        print(string.format("[ShareChest]Temp Remove Container From Chest"))            
                        chestmodel[i]:GetItemContainerModule()["TargetContainer"]=nil
                    end
                end
            end
        end
        ]]--
    end
end
function RecoverSpecialContainerToAllChests()
    if CheckInit() then
        --use bp mod,faster 
        manager=FindFirstOf("PalMapObjectManager")
        --print(tostring(manager:GetFullName()))
        if manager~=nil and manager:IsValid() then
            MyMod:RecoverSpecialContainerToAllChests(manager,mySpecialContainer,ModelName)
        end
        --[[
        chestmodel=FindAllOf(ModelName)
        if chestmodel~=nil then
            print(string.format("[ShareChest]Searching Chest %d",#chestmodel))
            for i=1,#chestmodel do
                if chestmodel[i]:GetItemContainerModule():IsValid() then
                    local container=chestmodel[i]:GetItemContainerModule():GetContainer()
                    if not container:IsValid() then
                        print(string.format("[ShareChest]Recover Container To Chest"))            
                        chestmodel[i]:GetItemContainerModule()["TargetContainer"]=mySpecialContainer
                    end
                end
            end
        end]]--
    end
end

function InitSpecialContainer(ct,searchContainers)
    local chestmodel=FindAllOf(ModelName)
    --可以尝试从箱子中找，但是没必要，因为blueprint中遍历Container很快
    --遍历容器查找特定格子数的Container
    local manager=FindFirstOf("PalItemContainerManager")
    if searchContainers and manager~=nil and manager:IsValid() then
        --调用BPmod查找，非常快
        MyMod:FindContainerBySlotNum(manager,mySpecialNumber,ModelName)
        local x={}
        local y={}
        MyMod:GetResultContainer(ResultIndex,x)--返回值
        MyMod:GetResultBool(ResultIndex,y)--是否成功
        if y.Result and x.Result~=nil and x.Result:IsValid() then
            print("[One Chest]Find Special Container:")
            print(tostring(x.Result:GetFullName()))
            print(tostring(x.Result:Num()))
            return x.Result
        end
    end
    --找不到说明尚未初始化过/之前的SpecialContainer因为箱子被攻击销毁了
    --从箱子里任选一个升格为SpecialContainer，优先找空的
    if chestmodel~=nil then
        --找空的
        for i=1,#chestmodel do
            if chestmodel[i]:GetItemContainerModule():IsValid() then
                local container=chestmodel[i]:GetItemContainerModule():GetContainer()
                if container ~=nil and container:IsValid() and container:IsEmpty() and container:Num()>0 then
                    print(string.format("[ShareChest]No Special Container,Elect from a Chest"))
                    --扩容
                    MyMod:AddSlotToContainer(container,mySpecialNumber - container:Num())
                    return container
                end
            end
        end
        --非空
        for i=1,#chestmodel do
            if chestmodel[i]:GetItemContainerModule():IsValid() then
                local container=chestmodel[i]:GetItemContainerModule():GetContainer()
                if container ~=nil and container:IsValid() and not container:IsEmpty() and container:Num()>0 then
                    print(string.format("[ShareChest]No Special Container,Elect from a Chest"))
                    --扩容
                    MyMod:AddSlotToContainer(container,mySpecialNumber - container:Num())
                    return container
                end
            end
        end
    end
    print("[ShareChest]Can't get Special Container")
end
end