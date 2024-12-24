#pragma once
#include "CoreMinimal.h"
#include "UObject/NoExportTypes.h"
#include "Components/ActorComponent.h"
#include "EPalShopBuyResultType.h"
#include "PalCharacterSlotId.h"
#include "PalCharacterStoredParameterId.h"
#include "PalDroppedPalProductDataForShop.h"
#include "PalItemSlotIdAndNum.h"
#include "PalNetworkShopComponent.generated.h"

class AActor;

UCLASS(Blueprintable, ClassGroup=Custom, meta=(BlueprintSpawnableComponent))
class UPalNetworkShopComponent : public UActorComponent {
    GENERATED_BODY()
public:
    UPalNetworkShopComponent(const FObjectInitializer& ObjectInitializer);

    UFUNCTION(BlueprintCallable, Reliable, Server)
    void SetupShopDataForActor_ToServer(AActor* VenderActor);
    
    UFUNCTION(BlueprintCallable, Reliable, Server)
    void RequestSellPals_ToServer(const FGuid& ShopID, const TArray<FPalCharacterSlotId>& SellPalSlotIDArray);
    
    UFUNCTION(BlueprintCallable, Reliable, Server)
    void RequestSellItems_ToServer(const FGuid& ShopID, const TArray<FPalItemSlotIdAndNum>& SellItemSlotIDArray);
    
    UFUNCTION(BlueprintCallable, Reliable, Server)
    void RequestCollectDroppedPalProductData(const int32 MaxCollectNum);
    
    UFUNCTION(BlueprintCallable, Reliable, Server)
    void RequestBuyProduct_ToServer(const FGuid& ShopID, const FGuid& ProductId, int32 BuyNum);
    
    UFUNCTION(BlueprintCallable, Reliable, Server)
    void RequestBuyLostPal_ToServer(const FPalCharacterStoredParameterId& StoredParameterId);
    
    UFUNCTION(BlueprintCallable, Client, Reliable)
    void RecieveBuyResult_ToClient(EPalShopBuyResultType resultType);
    
    UFUNCTION(BlueprintCallable, Client, Reliable)
    void ReceiveDroppedPalProductData_ToClient(const TArray<FPalDroppedPalProductDataForShop>& CollectedData);
    
};

