//
//  ALObservableModel.h
//  UITask6
//
//  Created by Alexander Lisovets on 10/21/14.
//  Copyright (c) 2014 Alexander Lisovets. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ALObservable.h"

@protocol ALObservableModel <ALObservable>
@optional

- (void)load;
- (void)unload;
- (void)save;
- (void)cancel;
- (void)refreshState;

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
