//
//  ALAbstractModel.h
//  UITask3
//
//  Created by Alexander Lisovets on 9/17/14.
//  Copyright (c) 2014 Alexander Lisovets. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ALObservableObject.h"

typedef enum ALModelState {
    ALModelUnloaded,
    ALModelLoading,
    ALModelLoaded,
    ALPartiallyLoaded,
    ALModelFailed,
    ALModelCanceled
} ALModelState;

@interface ALAbstractModel : ALObservableObject
@property (atomic, readonly) ALModelState  state;

- (void)load;
- (void)unload;
- (void)save;
- (void)cancel;

- (void)startLoading;
- (void)performLoading;
- (void)performUnloading;
- (void)performSaving;
- (void)performCanceling;

- (void)finishPartlyLoading;
- (void)finishLoading;
- (void)finishUnloading;
- (void)failLoading;
- (void)cancelLoading;

@end
