#include "PalCutsceneActor.h"

APalCutsceneActor::APalCutsceneActor(const FObjectInitializer& ObjectInitializer) : Super(ObjectInitializer) {
    this->OpeningFadeInDelay = 0.00f;
    this->OpeningFadeInTime = 0.00f;
    this->bCanSkip = true;
}

void APalCutsceneActor::SetTransformOrigin(const FTransform& TransformOrigin) {
}





