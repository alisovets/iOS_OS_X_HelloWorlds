//
//  ALWashingController.h
//  Training task5
//
//  Created by Alexander Lisovets on 8/27/14.
//  Copyright (c) 2014 Alexander Lisovets. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "ALObserver.h"

@class ALCar;
@class ALAdministrativeBuilding;
@class ALWashBuilding;
@class ALWasher;

@interface ALWashingController : NSObject<ALObserver>
+ (id) controller;

- (id)initWithAdministrativeBilding:(ALAdministrativeBuilding *)administrativeBuilding
                       washBuilding:(ALWashBuilding *)washBuilding;

- (void)run;

@end
