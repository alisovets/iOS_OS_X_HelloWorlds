//
//  ALAdministrativeBuilding.m
//  training task3
//
//  Created by Alexander Lisovets on 8/15/14.
//  Copyright (c) 2014 Alexander Lisovets. All rights reserved.
//

#import "ALAdministrativeBuilding.h"

@implementation ALAdministrativeBuilding

#pragma mark -
#pragma mark Class Methods

+ (ALAdministrativeBuilding *)administrativeBuilding {
    ALRoom *room = [ALRoom room];
    
    return [[[ALAdministrativeBuilding alloc] initWithRoom:room] autorelease];
}

@end
