//
//  ALWoshBuilding.m
//  training task3
//
//  Created by Alexander Lisovets on 8/15/14.
//  Copyright (c) 2014 Alexander Lisovets. All rights reserved.
//

#import "ALWashBuilding.h"

@implementation ALWashBuilding

#pragma mark -
#pragma mark Class Methods

+ (ALWashBuilding *)washBuilding {
    ALWashRoom *washRoom = [ALWashRoom washRoom];
    
    return [[[ALWashBuilding alloc] initWithRoom:washRoom] autorelease];
}

#pragma mark -
#pragma mark Public

- (BOOL)addCar:(ALCar *)car{
    ALWashRoom *washRoom = (ALWashRoom *)self.room;
    
    return [washRoom addCar:car];
}

- (BOOL)removeCar:(ALCar *)car{
    ALWashRoom *washRoom = (ALWashRoom *)self.room;
    
    return [washRoom removeCar:car];
}

- (ALCar *)waitingCar {
    ALWashRoom *washRoom = (ALWashRoom *)self.room;
    
    return washRoom.waitingCar;
}

@end
