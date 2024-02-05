local bShareFoodBox = false
local OnlyMergeCertainChest=0

local OnlyMergeCertainChestFood=0
local mySpecialContainer=nil
local mySpecialNumber=239

local mySpecialContainerFood=nil
local mySpecialNumberFood=97

local ModelName="PalMapObjectItemChestModel"
local ModelNameFood="PalMapObjectPalFoodBoxModel"

--PlayerController:ClientRestart在上下马时也会触发
--Pre/PostBeginPlay因为BPModLoader的bug会重复触发，因此在bpmod加入原生的BeginPlay事件，并hook其ReceiveBeginPlay函数
--ReceiveBeginPlay会在启动游戏、进入退出一场游戏时触发，获取GameMode总是获取到1因此不能用于判断？
--结束游戏时触发的这次没有影响，会搜索所有container获得空，然后因为containerModule不valid什么都不做
--第一次ClientRestart肯定是进游戏(或者刚启动游戏)，此时hook ReceiveBeginPlay, 之后用ReceiveBeginPlay触发初始化；第一次进游戏时该hook也能触发
--Hook对于Bp-only函数(即使不以/Script开头的函数)是posthook，对bp-only函数(/Script开头的)是prehook,因此ReceiveBeginPlay的hook会在各种创建完毕时执行
--BP-only函数如果被hook多次，只有最先执行的会生效,非bp则会正常生效(也是bug?)
local hooked=false
RegisterHook("/Script/Engine.PlayerController:ClientRestart", function(Context)
    if not hooked then
        RegisterHook("/Game/Mods/ShareChest/ModActor.ModActor_C:ReceiveBeginPlay",function()
            ExecuteWithDelay(5000,function()
                ExecuteInGameThread(function()
                    Init()
                end)
            end)
        end)
        --在某些用户的机器上，ClientRestart会在启动游戏时就触发一次，而此时ReceiveBeginPlay的hook会失败，原因不明
        --因此需要把hooked=true放在后面，这样如果RegisterHooke失败了hooked就不会被赋值
        hooked=true
    end
end)

--任意建筑完成时尝试合并空箱子(直接造完的如木地板不会触发)
--如果在拆除模式内触发该函数，产生了新的Container不为空的箱子，再将其拆除，会导致SpecialContainer销毁；忽略这个问题
RegisterHook("/Script/Pal.PalBuildProcess:OnFinishWorkInServer",function(self,Work)
    --如果建筑完成时CheckInit=false,说明此前可能没有任何备选的SpecialContainer
    --此时尝试查找箱子并将其升格为SpecialContainer1
    --这种情况可能是之前箱子被攻击破坏造成的，此时可能会有Container为空的箱子，尝试修复
    if (not CheckInit()) or (bShareFoodBox and not CheckInitFood())then
         InitSpecialContainer(false)
         RecoverSpecialContainerToAllChests()
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

    --初始化
function Init()
    mySpecialContainer=nil
    mySpecialContainerFood=nil
    print("[ShareChest]Start Init")
    MyMod=StaticFindObject("/Game/Mods/ShareChest/ModActor.Default__ModActor_C")
    InitSpecialContainer(true)
    if CheckInit() then
        --种种原因(如箱子被攻击破坏导致Container销毁)使得一些箱子的Container为空，在启动时自动修复
        RecoverSpecialContainerToAllChests()
        --自动合并空箱
        MergeEmptyChestToSpecial()
    end
end
function MergeEmptyChestToSpecial()
    --use bp mod,faster 
    if CheckInit() then 
        local manager=FindFirstOf("PalMapObjectManager")
        if manager~=nil and manager:IsValid() then
            MyMod:MergeEmptyChestToSpecial(manager,mySpecialNumber,mySpecialContainer,ModelName,OnlyMergeCertainChest)
        end
    end
    if CheckInitFood() then
        local manager=FindFirstOf("PalMapObjectManager")
        if manager~=nil and manager:IsValid() then
            MyMod:MergeEmptyChestToSpecial(manager,mySpecialNumberFood,mySpecialContainerFood,ModelNameFood,OnlyMergeCertainChestFood)
        end
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

function CheckInit()
    if mySpecialContainer == nil or not mySpecialContainer:IsValid() or not mySpecialContainer:IsA("/Script/Pal.PalItemContainer") then
        return false
    end
    return true
end

function CheckInitFood()
    if not bShareFoodBox then 
        return false
    end
    if mySpecialContainerFood == nil or not mySpecialContainerFood:IsValid() or not mySpecialContainerFood:IsA("/Script/Pal.PalItemContainer") then
        return false
    end
    return true
end

function RemoveSpecialContainerFromAllChests()
    if CheckInit() then
        local manager=FindFirstOf("PalMapObjectManager")
        --print(tostring(manager:GetFullName()))
        if manager~=nil and manager:IsValid() then
            MyMod:RemoveSpecialContainerFromAllChests(manager,mySpecialContainer,ModelName)
        end
    end
    if CheckInitFood() then
        local manager=FindFirstOf("PalMapObjectManager")
        --print(tostring(manager:GetFullName()))
        if manager~=nil and manager:IsValid() then
            MyMod:RemoveSpecialContainerFromAllChests(manager,mySpecialContainerFood,ModelNameFood)
        end
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
function RecoverSpecialContainerToAllChests()
    --use bp mod,faster 
    if CheckInit() then
        local manager=FindFirstOf("PalMapObjectManager")
        --print(tostring(manager:GetFullName()))
        if manager~=nil and manager:IsValid() then
            MyMod:RecoverSpecialContainerToAllChests(manager,mySpecialContainer,ModelName)
        end
    end
    if CheckInitFood() then
        local manager=FindFirstOf("PalMapObjectManager")
        --print(tostring(manager:GetFullName()))
        if manager~=nil and manager:IsValid() then
            MyMod:RecoverSpecialContainerToAllChests(manager,mySpecialContainerFood,ModelNameFood)
        end
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

function InitSpecialContainer(searchContainers)
    --可以尝试从箱子中找，但是没必要，因为blueprint中遍历Container很快
    --遍历容器查找特定格子数的Container
    local manager=FindFirstOf("PalItemContainerManager")
    if searchContainers and manager~=nil and manager:IsValid() then
        --调用BPmod查找，非常快
        MyMod:FindContainerBySlotNum(manager,mySpecialNumber,mySpecialNumberFood)
        local x={}
        local y={}
        MyMod:GetResultContainer(x,{})--返回值
        MyMod:GetResultBool(y,{})--是否成功
        if y.Result and x.Result~=nil and x.Result:IsValid() then
            print("[ShareChest]Find Special Container:")
            print(tostring(x.Result:GetFullName()))
            print(tostring(x.Result:Num()))
            mySpecialContainer=x.Result
        end
        if y.Result2 and x.Result2~=nil and x.Result2:IsValid() then
            print("[ShareChest]Find Special Container Food:")
            print(tostring(x.Result2:GetFullName()))
            print(tostring(x.Result2:Num()))
            mySpecialContainerFood=x.Result2
        end
    end
    
    --找不到说明尚未初始化过/之前的SpecialContainer因为箱子被攻击销毁了
    --选出新的SpecialContainer
    if mySpecialContainer == nil then
        mySpecialContainer=StaticElectSpecialContainer(ModelName,mySpecialNumber,OnlyMergeCertainChest)
    end
    if bShareFoodBox and mySpecialContainerFood == nil then
        --找不到说明尚未初始化过/之前的SpecialContainer因为箱子被攻击销毁了
        mySpecialContainerFood=StaticElectSpecialContainer(ModelNameFood,mySpecialNumberFood,OnlyMergeCertainChestFood)
    end
    -- 延长腐败时间，因为每个连接到容器的箱子都会使得食物加快腐败速度
    if not CheckInit() then
        print("[ShareChest][Info]Can't get Special Container")
    else
        mySpecialContainer["CorruptionMultiplier"]=0.001
    end
    if not CheckInitFood() then
        print("[ShareChest][Info]Can't get Special Container Food")
    else
        mySpecialContainerFood["CorruptionMultiplier"]=0.001
    end
end

function StaticElectSpecialContainer(ModelName,SpecialNumber,MergeNumber)
    local chestmodel=FindAllOf(ModelName)
    --从箱子里任选一个升格为SpecialContainer，优先找空的
    if chestmodel~=nil then
        --找空的
        print(tostring(#chestmodel))
        for i=1,#chestmodel do
            print(tostring(chestmodel[i]))
            print(tostring(chestmodel[i]:GetFullName()))
            if chestmodel[i]:GetItemContainerModule():IsValid() then
                local container=chestmodel[i]:GetItemContainerModule():GetContainer()
                if container ~=nil and container:IsValid() and container:IsEmpty() and container:Num()<SpecialNumber then
                    if MergeNumber ==0 or container:Num()==MergeNumber then
                        print(string.format("[ShareChest]No Special Container,Elect from a Chest"))
                        --扩容
                        MyMod:AddSlotToContainer(container,SpecialNumber)
                        return container
                    end
                end
            end
        end
        --非空
        for i=1,#chestmodel do
            if chestmodel[i]:GetItemContainerModule():IsValid() then
                local container=chestmodel[i]:GetItemContainerModule():GetContainer()
                if container ~=nil and container:IsValid() and not container:IsEmpty() and container:Num()<SpecialNumber then
                    if MergeNumber ==0 or container:Num()==MergeNumber then
                        print(string.format("[ShareChest]No Special Container,Elect from a Chest"))
                        --扩容
                        MyMod:AddSlotToContainer(container,SpecialNumber)
                        return container
                    end
                end
            end
        end
    end
    return nil
end