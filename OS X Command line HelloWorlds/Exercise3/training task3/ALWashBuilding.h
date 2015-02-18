//
//  ALWoshBuilding.h
//  training task3
//
//  Created by Alexander Lisovets on 8/15/14.
//  Copyright (c) 2014 Alexander Lisovets. All rights reserved.
//

#import "ALBuilding.h"
#import "ALCar.h"
#import "ALBookkeeper.h"
#import "ALWashRoom.h"
#import "ALWasher.h"

@interface ALWashBuilding : ALBuilding

+ (ALWashBuilding *)washBuilding;

- (BOOL)addCar:(ALCar *)car;
- (BOOL)removeCar:(ALCar *)car;
- (ALCar *)waitingCar;

@end
