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
#import "ALWasher.h"

@interface ALWashBuilding : ALBuilding

+ (ALWashBuilding *)randomWashBuilding;

- (void)addCar:(ALCar *)car;
- (BOOL)removeCar:(ALCar *)car;
- (ALCar *)car;
- (ALCar *)dirtyCar;

@end
