local hooked=false
RegisterHook("/Script/Engine.PlayerController:ClientRestart", function(Context)
    ExecuteWithDelay(7000,function()
        ExecuteInGameThread(function()
            if not hooked then
                RegisterHook("/Game/Pal/Blueprint/UI/Inventory/WBP_PalItemScrollList.WBP_PalItemScrollList_C:OnHovered_Internal",function(self,ButtonBase)
                    print("AutoScroll")
                    scrollBox=self:get()["ScrollBox_0"]
                    --print(scrollBox:GetFullName())
                    scrollBox:ScrollWidgetIntoView(ButtonBase:get(),false,0,100)
                end)
                print("[Controller Scroll Chest]Init!")
                hooked=true
            end
        end)
    end)
end)


