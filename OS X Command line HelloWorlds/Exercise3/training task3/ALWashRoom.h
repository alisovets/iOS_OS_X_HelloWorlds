//
//  ALWoshRoom.h
//  training task3
//
//  Created by Alexander Lisovets on 8/15/14.
//  Copyright (c) 2014 Alexander Lisovets. All rights reserved.
//

#import "ALRoom.h"
#import "ALCar.h"

@interface ALWashRoom : ALRoom
@property (nonatomic, readonly) NSArray     *cars;
@property (nonatomic, readonly) NSInteger   availableCarPlaceCount;

+ (ALWashRoom *)washRoom;

- (id)initWithWorkplaceCount:(NSInteger)workplaceCount carPlaceCount:(NSInteger) carPlaceCount;

- (BOOL)addCar:(ALCar *)car;
- (BOOL)removeCar:(ALCar *)car;
- (ALCar *)waitingCar;

@end
