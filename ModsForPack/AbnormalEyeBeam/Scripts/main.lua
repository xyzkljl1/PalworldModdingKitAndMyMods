SKILL = "ElementResist_Normal_1_PAL"

MyMod=nil
local inited=false
RegisterHook("/Script/Engine.PlayerController:ClientRestart", function(Context)
    if not inited then
        inited=true
        Init()
    end
end)

function Init()
    MyMod=StaticFindObject("/Game/Mods/AbnormalEyeBeam/ModActor.Default__ModActor_C")
    PalUtility = StaticFindObject("/Script/Pal.Default__PalUtility")
    RegisterHook("/Game/Pal/Blueprint/UI/NPCHPGauge/WBP_PalNPCHPGaugeCanvas.WBP_PalNPCHPGaugeCanvas_C:AddNormalPalGauge", function(self,actor)
        if MyMod==nil or not MyMod:IsValid() then
            MyMod=StaticFindObject("/Game/Mods/AbnormalEyeBeam/ModActor.Default__ModActor_C")
            PalUtility = StaticFindObject("/Script/Pal.Default__PalUtility")
        end
        MyMod:AbnormalBeamDoIt(actor:get(),SKILL,PalUtility,"")
    end)
end