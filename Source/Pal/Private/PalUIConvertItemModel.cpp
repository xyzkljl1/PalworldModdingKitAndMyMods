#include "PalUIConvertItemModel.h"

UPalUIConvertItemModel::UPalUIConvertItemModel() {
    this->ProductSettingModel = NULL;
    this->bCanTransportOut = false;
}

void UPalUIConvertItemModel::UpdateProductSetting_TransportToStorage(const bool bOn) {
}

bool UPalUIConvertItemModel::TryGetConcreteModel(UPalMapObjectConvertItemModel*& Model) {
    return false;
}

void UPalUIConvertItemModel::StartProduction() {
}

void UPalUIConvertItemModel::Initialize(UPalMapObjectConvertItemModel* InModel) {
}

FText UPalUIConvertItemModel::GetBuildObjectName() const {
    return FText::GetEmpty();
}

EPalUIConvertItemRequestStartResponse UPalUIConvertItemModel::CanStartProduction() const {
    return EPalUIConvertItemRequestStartResponse::Enable;
}


