#include "PalMapObjectDeathPenaltyStorageModel.h"
#include "Net/UnrealNetwork.h"

UPalMapObjectDeathPenaltyStorageModel::UPalMapObjectDeathPenaltyStorageModel() {
    this->bCanOpenByProgressTime = false;
}

void UPalMapObjectDeathPenaltyStorageModel::OnChangedPlayerInfoInLocalPlayerGuild_ClientInternal(APalPlayerState* LocalPlayerState) {
}

bool UPalMapObjectDeathPenaltyStorageModel::IsSameGuildInLocalPlayer() const {
    return false;
}

void UPalMapObjectDeathPenaltyStorageModel::GetLifetimeReplicatedProps(TArray<FLifetimeProperty>& OutLifetimeProps) const {
    Super::GetLifetimeReplicatedProps(OutLifetimeProps);
    
    DOREPLIFETIME(UPalMapObjectDeathPenaltyStorageModel, OwnerPlayerUId);
    DOREPLIFETIME(UPalMapObjectDeathPenaltyStorageModel, LocationId);
    DOREPLIFETIME(UPalMapObjectDeathPenaltyStorageModel, bCanOpenByProgressTime);
}


