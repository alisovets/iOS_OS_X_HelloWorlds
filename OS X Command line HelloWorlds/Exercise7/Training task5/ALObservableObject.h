//
//  ALObservableObject.h
//  training task4
//
//  Created by Alexander Lisovets on 8/21/14.
//  Copyright (c) 2014 Alexander Lisovets. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "ALObserver.h"

@interface ALObservableObject : NSObject
@property (nonatomic, retain) NSMutableSet *observerSet;

- (void)registerObserver:(id<ALObserver>)observer;
- (void)unregisterObserver:(id<ALObserver>)observer;

- (void)notifyFinishForWorking;
- (void)notifyReadyForWorking;

@end
