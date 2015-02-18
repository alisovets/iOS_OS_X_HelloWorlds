//
//  ALBuilding.m
//  training task3
//
//  Created by Alexander Lisovets on 8/15/14.
//  Copyright (c) 2014 Alexander Lisovets. All rights reserved.
//

#import "ALBuilding.h"

@interface ALBuilding ()
@property (nonatomic, copy)   NSArray *rooms;

@end

@implementation ALBuilding

#pragma mark -
#pragma mark Initializations and Deallocations

- (void)dealloc {
    self.rooms = nil;
    
    [super dealloc];
}

- (id)initWithRooms:(NSArray *)rooms {
    self = [super init];
    if (self) {
        self.rooms = rooms;
    }
    
    return self;
}

#pragma mark -
#pragma mark Accesors

- (NSInteger) vacantWorkplaceCount {
    NSInteger count = 0;
    for (ALRoom *room in self.rooms) {
        count += room.vacantWorkplaceCount;
    }
    
    return count;
}

#pragma mark -
#pragma mark Public

- (BOOL)addHuman:(ALHuman *)human {
    for (ALRoom *room in self.rooms) {
        if ([room addHuman:human]) {
            return YES;
        }
    }
    
    return NO;
}

- (BOOL)removeHuman:(ALHuman *)human {
    for (ALRoom *room in self.rooms) {
        if ([room removeHuman:human]) {
            return YES;
        }
    }
    
    return NO;
}

- (id)humanWithClass:(Class)aClass {
    for (ALRoom *room in self.rooms) {
        for (ALHuman *human in room.humans){
            if ([human isMemberOfClass:aClass]) {
                return human;
            }
        }
    }
    
    return nil;
}

@end
