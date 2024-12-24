#pragma once
#include "CoreMinimal.h"
#include "Components/ActorComponent.h"
#include "EPalBossBattleCombatResult.h"
#include "EPalBossBattleDifficulty.h"
#include "EPalBossBattleSequenceType.h"
#include "EPalBossType.h"
#include "PalStageInstanceId.h"
#include "PalNetworkBossBattleComponent.generated.h"

class APalPlayerCharacter;

UCLASS(Blueprintable, ClassGroup=Custom, meta=(BlueprintSpawnableComponent))
class PAL_API UPalNetworkBossBattleComponent : public UActorComponent {
    GENERATED_BODY()
public:
    UPalNetworkBossBattleComponent(const FObjectInitializer& ObjectInitializer);

    UFUNCTION(BlueprintCallable, Client, Reliable)
    void UnlockAchievement_ToClient(EPalBossType BossType);
    
    UFUNCTION(BlueprintCallable, Reliable, Server)
    void RequestBossBattleStart_ToServer(EPalBossType BossType);
    
    UFUNCTION(BlueprintCallable, Client, Reliable)
    void RequestBossBattleStart_ToClient(bool IsSuccess, EPalBossType BossType, const FPalStageInstanceId StageInstanceId, const TArray<APalPlayerCharacter*>& JoinPlayers);
    
    UFUNCTION(BlueprintCallable, Reliable, Server)
    void RequestBossBattleEntry_ToServer(EPalBossType BossType, EPalBossBattleDifficulty Difficulty);
    
    UFUNCTION(BlueprintCallable, Client, Reliable)
    void RemovePlayerFromRoom_ToClient(EPalBossType BossType, APalPlayerCharacter* DeadPlayer);
    
    UFUNCTION(BlueprintCallable, Reliable, Server)
    void NoticeSequenceEnd_ToServer(EPalBossType BossType);
    
    UFUNCTION(BlueprintCallable, Client, Reliable)
    void CombatResult_ToClient(EPalBossType BossType, EPalBossBattleCombatResult CombatResult);
    
    UFUNCTION(BlueprintCallable, Client, Reliable)
    void ChangeSequence_ToClient(EPalBossType BossType, EPalBossBattleSequenceType NextSequence);
    
};

