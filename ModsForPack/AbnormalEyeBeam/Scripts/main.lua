SKILL = "ElementResist_Normal_1_PAL"

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
        --print(tostring(actor:get():GetFullName()))
        --handler=PalUtility:GetIndividualCharacterHandleByActor(actor:get())
        --print(string.format("[AbnormalEyeBeam]Check %s",handler:GetFullName()))
        --MyMod:PrintSkill(handler)
        MyMod:AbnormalBeamDoIt(actor:get(),SKILL,PalUtility,"")
    end)
end



--[[
RegisterKeyBind(Key.F4,function(self)
    Init()
end)
RegisterKeyBind(Key.F2,function(self)
    MyMod=StaticFindObject("/Game/Mods/AbnormalEyeBeam/ModActor.Default__ModActor_C")
    PalUtility = StaticFindObject("/Script/Pal.Default__PalUtility")
    handle=StaticFindObject("/Game/Pal/Maps/MainWorld_5/PL_MainWorld5.PL_MainWorld5:BP_PalCharacterManager_C_2147481883.PalIndividualCharacterHandle_2147480784")
    --/Game/Pal/Maps/MainWorld_5/PL_MainWorld5.PL_MainWorld5:BP_PalCharacterManager_C_2147481889.PalIndividualCharacterHandle_2147480801
    --/Game/Pal/Maps/MainWorld_5/PL_MainWorld5.PL_MainWorld5:BP_PalCharacterManager_C_2147481889.PalIndividualCharacterHandle_2147480789
    MyMod:PrintSkill(handle)
    para=handle:TryGetIndividualParameter()
    
    print(tostring(para:GetShotAttack()))
    print(tostring(para:GetMeleeAttack()))
    print(tostring(para:GetShotAttack_withBuff()))
    print(tostring(para:GetMeleeAttack_withBuff()))
    MyMod:AbnormalBeamDoIt(handle,"PAL_ALLAttack_up2",PalUtility,"",false)
    --para:AddPassiveSkill("PAL_ALLAttack_up2","Attack_ACC_up3")
    --para2=para:GetSaveParameter()
    --print(tostring(para2["Rank_Attack"]))
    --menu=StaticFindObject("/Engine/Transient.GameEngine_2147482603:BP_PalGameInstance_C_2147482547.WBP_PalStatus_C_2147395969.WidgetTree_2147395968.WBP_MainMenu_Pal_00")
    --menu=FindFirstOf("WBP_MainMenu_Pal_00_C")
    --menu["Text_RangeAttackValue"]:SetText_GDKInternal(true,"4123\r")
end)

RegisterKeyBind(Key.F3,function()
    --PalGameSetting=FindFirstOf("PalGameSetting")
    --PalGameSetting.PickupItemOnLevelExp = 10000
	--PalGameSetting.BuildExp = 10000
	--PalGameSetting.CraftExp = 10000
    --Init()
    RegisterHook("/Game/Pal/Blueprint/UI/UserInterface/MainMenu/Pal/WBP_MainMenu_Pal_00.WBP_MainMenu_Pal_00_C:Update Buff Status",function(self)
        print("!!!")    
    --t=self:get()["BP_PalTextBlock_C_2"]
        t=self:get()["CachedIndividualHandle"]
        print(t:GetFullName())
        --print(tostring(t:GetFullName()))
        --x=t:GetText()
        --t:SetText_GDKInternal(true,"123")
        --print(tostring(x:GetFullName()))
    end)
    --trigger on hover it
end)
]]--