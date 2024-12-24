#include "PalStaticItemDataBase.h"
#include "Templates/SubclassOf.h"

UPalStaticItemDataBase::UPalStaticItemDataBase() {
    this->TypeA = EPalItemTypeA::None;
    this->TypeB = EPalItemTypeB::None;
    this->Rank = 0;
    this->Rarity = 0;
    this->Price = 0;
    this->MaxStackCount = 0;
    this->SortID = 0;
    this->DynamicItemDataClass = NULL;
    this->bNotConsumed = false;
    this->DropItemType = EPalDropItemType::None;
    this->Weight = 0.00f;
    this->Durability = 0.00f;
    this->CorruptionFactor = 0.00f;
    this->FloatValue1 = 0.00f;
}

bool UPalStaticItemDataBase::IsCorruptible() const {
    return false;
}

bool UPalStaticItemDataBase::HasDynamicItemClass() const {
    return false;
}

bool UPalStaticItemDataBase::HasActorClass() const {
    return false;
}

float UPalStaticItemDataBase::GetWorldScaledWeight(const UObject* WorldContextObject) const {
    return 0.0f;
}

TSoftClassPtr<AActor> UPalStaticItemDataBase::GetVisualBlueprintClass(const UObject* WorldContextObject) const {
    return NULL;
}

FName UPalStaticItemDataBase::GetPassiveSkill4() const {
    return NAME_None;
}

FName UPalStaticItemDataBase::GetPassiveSkill3() const {
    return NAME_None;
}

FName UPalStaticItemDataBase::GetPassiveSkill2() const {
    return NAME_None;
}

FName UPalStaticItemDataBase::GetPassiveSkill() const {
    return NAME_None;
}

void UPalStaticItemDataBase::GetNameMsgId(FName& OutMsgID) const {
}

int32 UPalStaticItemDataBase::GetMaxStackCount() const {
    return 0;
}

FName UPalStaticItemDataBase::GetId() const {
    return NAME_None;
}

TSubclassOf<UPalDynamicItemDataBase> UPalStaticItemDataBase::GetDynamicItemDataClass() const {
    return NULL;
}

void UPalStaticItemDataBase::GetDescriptionMsgId(FName& OutMsgID) const {
}

void UPalStaticItemDataBase::GetAllPassiveSkill(TArray<FName>& OutArray) const {
}

TSoftClassPtr<AActor> UPalStaticItemDataBase::GetActorClass() const {
    return NULL;
}

bool UPalStaticItemDataBase::CanUseItemToCharacter(const UObject* WorldContentObject, const FPalInstanceID& TargetCharacterID) {
    return false;
}


