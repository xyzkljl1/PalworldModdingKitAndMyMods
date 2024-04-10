local MyMod=nil
local hooked=false
RegisterHook("/Script/Engine.PlayerController:ClientRestart", function(Context)
    if not hooked then
        RegisterHook("/Script/Pal.PalNetworkIndividualComponent:EatItem_ToServer",function(self,ID,itemData)
            item=itemData:get()["ID"]:ToString()
            if item=="Cake" then
                FindMyMod()
                x=ID:get()["InstanceId"]
                y=ID:get()["PlayerUId"]
                MyMod:AddIV(x["A"],x["B"],x["C"],x["D"],y["A"],y["B"],y["C"],y["D"],2)
                --MyMod:AddIV(1,2,3,4,5,6,7,8,2)
            end
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
