//
//  ALWashingController.h
//  Training task6
//
//  Created by Admin on 8/31/14.
//  Copyright (c) 2014 Alexander Lisovets. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "ALObserver.h"

@class ALCar;
@class ALAdministrativeBuilding;
@class ALWashBuilding;
@class ALWasher;
@class ALManager;
@class ALHandlerDispatcher;

@interface ALWashingController : NSObject<ALObserver>
@property (nonatomic, readonly) ALHandlerDispatcher *washingDispatcher;
@property (nonatomic, readonly) ALHandlerDispatcher *bookkeeperDispatcher;
@property (nonatomic, readonly) ALManager           *manager;

+ (id)controller;

- (id)initWithBookeeperCount:(NSInteger)bookkeeperCount washerCount:(NSInteger)washerCount;

- (void)run;

@end
