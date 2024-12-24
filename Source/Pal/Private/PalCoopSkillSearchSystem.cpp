#include "PalCoopSkillSearchSystem.h"
#include "Templates/SubclassOf.h"

UPalCoopSkillSearchSystem::UPalCoopSkillSearchSystem() {
    this->EffectControllerClass = NULL;
    this->LocationRegister = NULL;
    this->EffectController = NULL;
}

void UPalCoopSkillSearchSystem::StartSearchEffect(const FPalCoopSkillSearchEffectParameter& EffectParam) {
}

bool UPalCoopSkillSearchSystem::IsRunning() const {
    return false;
}

bool UPalCoopSkillSearchSystem::IsFadingOut() const {
    return false;
}

UPalCoopSkillSearchBase* UPalCoopSkillSearchSystem::CreateSearchObject(TSubclassOf<UPalCoopSkillSearchBase> SearchClass) {
    return NULL;
}


