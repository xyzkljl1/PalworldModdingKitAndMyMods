local MyMod=nil
local hooked=false
RegisterHook("/Script/Engine.PlayerController:ClientRestart", function(Context)
    if not hooked then
        RegisterHook("Function /Script/Pal.PalPlayerController:RequestUseItemToCharacter_ToServer",function(self,SlotAndNum,ID)            
                SlotID=SlotAndNum:get()["SlotID"]
                ContainerID=SlotID["ContainerId"]["ID"]
                FindMyMod()
                x=ID:get()["InstanceId"]
                y=ID:get()["PlayerUId"]
                MyMod:AddIV(x["A"],x["B"],x["C"],x["D"],y["A"],y["B"],y["C"],y["D"],2,
                            ContainerID["A"],ContainerID["B"],ContainerID["C"],ContainerID["D"],SlotID["SlotIndex"],"Cake")
        end)
        hooked=true
    end
end)


function FindMyMod()    
    local modActors = FindAllOf("ModActor_C");
    for idx, modActor in ipairs(modActors) do
        if modActor:IsA("/Game/Mods/IVMedicine/ModActor.ModActor_C") then
            MyMod=modActor
        end
    end
end
