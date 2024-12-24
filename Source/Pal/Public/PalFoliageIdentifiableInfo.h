#pragma once
#include "CoreMinimal.h"
#include "PalCellCoord.h"
#include "PalFoliageInstanceId.h"
#include "PalFoliageIdentifiableInfo.generated.h"

USTRUCT(BlueprintType)
struct FPalFoliageIdentifiableInfo {
    GENERATED_BODY()
public:
    UPROPERTY(BlueprintReadWrite, EditAnywhere, meta=(AllowPrivateAccess=true))
    FPalCellCoord CellCoord;
    
    UPROPERTY(BlueprintReadWrite, EditAnywhere, meta=(AllowPrivateAccess=true))
    FName ModelId;
    
    UPROPERTY(BlueprintReadWrite, EditAnywhere, meta=(AllowPrivateAccess=true))
    FPalFoliageInstanceId InstanceId;
    
    PAL_API FPalFoliageIdentifiableInfo();
};

