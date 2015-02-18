//
//  ALAdministrativeBuilding.m
//  training task3
//
//  Created by Alexander Lisovets on 8/15/14.
//  Copyright (c) 2014 Alexander Lisovets. All rights reserved.
//

#import "ALAdministrativeBuilding.h"

static const NSInteger ALDefaultRoomAmount      = 1;
static const NSInteger ALDefaultWorkplaceCount  = 20;

@implementation ALAdministrativeBuilding

#pragma mark -
#pragma mark Class Methods

+ (ALAdministrativeBuilding *)administrativeBuilding {
    NSMutableArray *mutableRooms = [[NSMutableArray alloc] initWithCapacity:ALDefaultRoomAmount];
    for (int index = 0; index < ALDefaultRoomAmount; index++) {
        ALRoom *room = [ALRoom roomWithWorkplaceCount:ALDefaultWorkplaceCount];
        [mutableRooms addObject:room];
    }

    ALAdministrativeBuilding *administrativeBuilding = [[[ALAdministrativeBuilding alloc]
                                                         initWithRooms:mutableRooms] autorelease];
    [mutableRooms release];
    
    return administrativeBuilding;
}

@end
