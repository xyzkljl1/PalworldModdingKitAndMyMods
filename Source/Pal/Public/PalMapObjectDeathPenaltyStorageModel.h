#pragma once
#include "CoreMinimal.h"
#include "UObject/NoExportTypes.h"
#include "UObject/NoExportTypes.h"
#include "PalMapObjectItemStorageModel.h"
#include "PalMapObjectDeathPenaltyStorageModel.generated.h"

class APalPlayerState;
class UPalMapObjectDeathPenaltyStorageModel;

UCLASS(Blueprintable)
class PAL_API UPalMapObjectDeathPenaltyStorageModel : public UPalMapObjectItemStorageModel {
    GENERATED_BODY()
public:
    DECLARE_DYNAMIC_MULTICAST_DELEGATE_OneParam(FReturnSelfDelegate, UPalMapObjectDeathPenaltyStorageModel*, Model);
    
    UPROPERTY(BlueprintAssignable, BlueprintReadWrite, EditAnywhere, meta=(AllowPrivateAccess=true))
    FReturnSelfDelegate OnNotifiedGuildUpdateInClientDelegate;
    
protected:
    UPROPERTY(BlueprintReadWrite, EditAnywhere, Replicated, Transient, meta=(AllowPrivateAccess=true))
    FGuid OwnerPlayerUId;
    
    UPROPERTY(BlueprintReadWrite, EditAnywhere, Replicated, Transient, meta=(AllowPrivateAccess=true))
    FGuid LocationId;
    
    UPROPERTY(BlueprintReadWrite, EditAnywhere, Replicated, Transient, meta=(AllowPrivateAccess=true))
    FDateTime CreatedAtRealTime;
    
    UPROPERTY(BlueprintReadWrite, EditAnywhere, Replicated, Transient, meta=(AllowPrivateAccess=true))
    bool bCanOpenByProgressTime;
    
public:
    UPalMapObjectDeathPenaltyStorageModel();

    virtual void GetLifetimeReplicatedProps(TArray<FLifetimeProperty>& OutLifetimeProps) const override;

private:
    UFUNCTION(BlueprintCallable)
    void OnChangedPlayerInfoInLocalPlayerGuild_ClientInternal(APalPlayerState* LocalPlayerState);
    
public:
    UFUNCTION(BlueprintCallable, BlueprintPure)
    bool IsSameGuildInLocalPlayer() const;
    
    UFUNCTION(BlueprintCallable, BlueprintPure)
    bool IsOpenForAnyone() const;
    
    UFUNCTION(BlueprintCallable, BlueprintPure)
    FDateTime GetCreatedAtRealTime() const;
    
};

