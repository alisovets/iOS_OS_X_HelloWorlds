//
//  ALAbstractModel.h
//  UITask3
//
//  Created by Alexander Lisovets on 9/17/14.
//  Copyright (c) 2014 Alexander Lisovets. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ALObservableObject.h"
#import "ALObservableModel.h"

typedef enum ALModelState {
    ALModelUnloaded,
    ALModelLoading,
    ALModelLoaded,
    ALPartiallyLoaded,
    ALModelFailed,
    ALModelCanceled
} ALModelState;

@interface ALAbstractModel : ALObservableObject<ALObservableModel>
@property (atomic, readonly) ALModelState  state;

@end
