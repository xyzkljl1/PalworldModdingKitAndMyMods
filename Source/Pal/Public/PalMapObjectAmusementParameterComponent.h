#pragma once
#include "CoreMinimal.h"
#include "Components/ActorComponent.h"
#include "Templates/SubclassOf.h"
#include "PalMapObjectAmusementParameterComponent.generated.h"

class UPalAIActionBaseCampInUsingAmusement;

UCLASS(Blueprintable, ClassGroup=Custom, meta=(BlueprintSpawnableComponent))
class UPalMapObjectAmusementParameterComponent : public UActorComponent {
    GENERATED_BODY()
public:
    UPROPERTY(BlueprintReadWrite, EditAnywhere, meta=(AllowPrivateAccess=true))
    float AffectSanityRate;
    
    UPROPERTY(BlueprintReadWrite, EditAnywhere, meta=(AllowPrivateAccess=true))
    TSubclassOf<UPalAIActionBaseCampInUsingAmusement> AIActionClass;
    
    UPalMapObjectAmusementParameterComponent(const FObjectInitializer& ObjectInitializer);

};

