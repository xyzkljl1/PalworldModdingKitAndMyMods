targetSlots=199
local hooked=false
RegisterHook("/Script/Engine.PlayerController:ClientRestart", function(Context)
    if not hooked then
        hooked=true
        RegisterHook("/Game/Mods/BiggerChest/ModActor.ModActor_C:ReceiveBeginPlay",function()
            MyMod=StaticFindObject("/Game/Mods/BiggerChest/ModActor.Default__ModActor_C")
            manager=FindFirstOf("PalMapObjectManager")
            DoIt()
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