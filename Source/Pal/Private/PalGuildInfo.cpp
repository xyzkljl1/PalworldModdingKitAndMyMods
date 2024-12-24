#include "PalGuildInfo.h"
#include "Net/UnrealNetwork.h"

APalGuildInfo::APalGuildInfo(const FObjectInitializer& ObjectInitializer) : Super(ObjectInitializer) {
    this->bAlwaysRelevant = true;
    this->bReplicates = true;
    const FProperty* p_RemoteRole = GetClass()->FindPropertyByName("RemoteRole");
    (*p_RemoteRole->ContainerPtrToValuePtr<TEnumAsByte<ENetRole>>(this)) = ROLE_SimulatedProxy;
    this->Guild = NULL;
}

void APalGuildInfo::OnUpdatePlayerInfo_ServerInternal(const UPalGroupGuildBase* InGuild, const FGuid& PlayerUId, const FPalGuildPlayerInfo& PlayerInfo) {
}

void APalGuildInfo::OnRep_PlayerUIds(const TArray<FGuid>& OldValue) {
}

void APalGuildInfo::OnRep_Guild(const UPalGroupGuildBase* OldValue) {
}

void APalGuildInfo::GetLifetimeReplicatedProps(TArray<FLifetimeProperty>& OutLifetimeProps) const {
    Super::GetLifetimeReplicatedProps(OutLifetimeProps);
    
    DOREPLIFETIME(APalGuildInfo, GroupId);
    DOREPLIFETIME(APalGuildInfo, PlayerUIds);
    DOREPLIFETIME(APalGuildInfo, Guild);
}


