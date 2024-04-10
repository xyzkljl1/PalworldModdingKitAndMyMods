local bShareFoodBox = false
local OnlyMergeCertainChest=0


--DO NOT MODIFY Following variables unless you know enought about them
--修复1.6和1.7版本将误将mySpecialNumber改成239造成的问题
local mySpecialNumber=237
local mySpecialNumberForFix=239
local mySpecialNumberFood=97

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
            ExecuteWithDelay(6000,function()
                ExecuteInGameThread(function()
                    FindMyMod()
                    MyMod:DebugEvent()
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
    MyMod:OnFinishWork(Work:get())
end)

--拆除模式时把容器的Container设为空以避免销毁容器
RegisterHook("/Script/Pal.PalUIDismantlingModel:Setup",function()
    MyMod:RemoveSpecialContainerFromAllChests()
end)
RegisterHook("/Script/Pal.PalUIDismantlingModel:FinishDismantling",function()
    MyMod:RecoverSpecialContainerToAllChests()
end)

    --初始化
function Init()
    mySpecialContainer=nil
    mySpecialContainerFood=nil
    print("[ShareChest]Start Init")
    MyMod:InitPara(mySpecialNumber,mySpecialNumberFood,mySpecialNumberFix,bShareFoodBox,OnlyMergeCertainChest)
    MyMod:InitSpecialContainer(true)
    --种种原因(如箱子被攻击破坏导致Container销毁)使得一些箱子的Container为空，在启动时自动修复
    MyMod:RecoverSpecialContainerToAllChests()
    --自动合并空箱
    MyMod:MergeEmptyChestToSpecial()
end

function FindMyMod()    
    local modActors = FindAllOf("ModActor_C");
    for idx, modActor in ipairs(modActors) do
        if modActor:IsA("/Game/Mods/ShareChest/ModActor.ModActor_C") then
            MyMod=modActor
            print("[ShareChest] Find BP Mod")
        end
    end
end