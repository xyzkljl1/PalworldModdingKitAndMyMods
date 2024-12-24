#include "PalNetworkCharacterComponent.h"
#include "Templates/SubclassOf.h"

UPalNetworkCharacterComponent::UPalNetworkCharacterComponent(const FObjectInitializer& ObjectInitializer) : Super(ObjectInitializer) {
}

void UPalNetworkCharacterComponent::RequestReflectAction_ToServer_Implementation(APalCharacter* Character) {
}

void UPalNetworkCharacterComponent::RequestRecordCountReward_ToServer_Implementation(const UObject* WorldContextObject, const FGuid PlayerUId, FPalRecordCountRewardData RequestData) {
}

void UPalNetworkCharacterComponent::RequestPalDisplayReward_ToServer_Implementation(const UObject* WorldContextObject, const FGuid PlayerUId, FPalDisplayRequestData RequestData) {
}

void UPalNetworkCharacterComponent::RequestNPCEmoteReward_ToServer_Implementation(const UObject* WorldContextObject, const FGuid PlayerUId, const FName FieldName, const FGuid& SaveId) {
}

void UPalNetworkCharacterComponent::RequestDoctorSurgi_ToServer_Implementation(UPalIndividualCharacterParameter* TargetPal, bool IsSuccess) {
}

void UPalNetworkCharacterComponent::RequestCircumNpcItemTrade_ToServer_Implementation(const UObject* WorldContextObject, const FGuid PlayerUId, FPalCircumRequestData CircumData, bool GrantExp) {
}

void UPalNetworkCharacterComponent::ReflectAction_ToClient_Implementation(APalCharacter* Character, FActionDynamicParameter Param, TSubclassOf<UPalActionBase> actionClass) {
}

void UPalNetworkCharacterComponent::NotifyTalkStart_ToServer_Implementation(APalPlayerCharacter* TalkPlayer, APalCharacter* TargetNPC) {
}

void UPalNetworkCharacterComponent::NotifyTalkEnd_ToServer_Implementation(APalPlayerCharacter* TalkPlayer, APalCharacter* TargetNPC) {
}

void UPalNetworkCharacterComponent::NotifySurgiResult_ToClient_Implementation(UPalIndividualCharacterParameter* TargetPal, FName GetPassive, FName LostPassive, int32 TalentValue, bool IsPositive) {
}

void UPalNetworkCharacterComponent::NotifyCustomFunction_ToServer_Implementation(APalPlayerCharacter* TalkPlayer, APalCharacter* TargetNPC, const FPalNPCTalkNotifyInfo& TalkNotifyInfo) {
}

void UPalNetworkCharacterComponent::ArenaStart_ToClient_Implementation(const FPalArenaStartParameter& StartParam) {
}

void UPalNetworkCharacterComponent::ArenaSetup_ToClient_Implementation() {
}


