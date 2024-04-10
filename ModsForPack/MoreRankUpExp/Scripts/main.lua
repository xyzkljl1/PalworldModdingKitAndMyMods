--Do no set to more than 59!
local MinRankUpExp=15

local hooked=false
RegisterHook("/Script/Engine.PlayerController:ClientRestart", function(Context)
    if not hooked then
        RegisterHook("/Script/Pal.PalUIPalCharacterRankUpModel:OnUpdateResourceSlot",function(Context,Slot)
            local charaHandle=Slot:get():GetHandle()
            if charaHandle~=nil and charaHandle:IsValid() then
                local param=charaHandle:TryGetIndividualParameter()["SaveParameter"]
                if param["RankUpExp"] < MinRankUpExp then
                    param["RankUpExp"]=MinRankUpExp
                    print("[MoreRankUpExp]Increase RankUpExp")
                end
            end
            end,function()end)
        print("[MoreRankUpExp]Init")
        hooked=true
    end
end)