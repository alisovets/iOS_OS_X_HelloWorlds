//
//  ALWoshBuilding.m
//  training task3
//
//  Created by Alexander Lisovets on 8/15/14.
//  Copyright (c) 2014 Alexander Lisovets. All rights reserved.
//

#import "ALWashBuilding.h"

static const NSInteger ALRoomAmount             = 4;
static const NSInteger ALDefaultWorkplaceCount  = 1;

@interface ALWashBuilding ()
@property (atomic, retain) NSMutableArray *mutableCars;

@end

@implementation ALWashBuilding

#pragma mark -
#pragma mark Class Methods

+ (ALWashBuilding *)washBuilding; {
    NSMutableArray *mutableRooms = [[NSMutableArray alloc] initWithCapacity:ALRoomAmount];
    for (int index = 0; index < ALRoomAmount; index++) {
            ALRoom *washRoom = [ALRoom roomWithWorkplaceCount:ALDefaultWorkplaceCount];
            [mutableRooms addObject:washRoom];
    }
    
    ALWashBuilding *washBuilding = [[[ALWashBuilding alloc] initWithRooms:mutableRooms] autorelease];
    [mutableRooms release];
    
    return washBuilding;
}

@end

