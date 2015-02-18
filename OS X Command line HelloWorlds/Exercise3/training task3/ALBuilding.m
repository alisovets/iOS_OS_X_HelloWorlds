//
//  ALBuilding.m
//  training task3
//
//  Created by Alexander Lisovets on 8/15/14.
//  Copyright (c) 2014 Alexander Lisovets. All rights reserved.
//

#import "ALBuilding.h"

@interface ALBuilding ()
@property (nonatomic, retain)   ALRoom *room;

@end

@implementation ALBuilding

#pragma mark -
#pragma mark Initializations and Deallocations

- (void)dealloc {
    self.room = nil;
    
    [super dealloc];
}

- (id)initWithRoom:(ALRoom *)room {
    self = [super init];
    if (self) {
        self.room = room;
    }
    
    return self;
}

#pragma mark -
#pragma mark Accesors

- (NSInteger) vacancyCount {
    return self.room.vacantWorkplaceCount;
}

#pragma mark -
#pragma mark Public

- (BOOL)addHuman:(ALHuman *)human {
    return [self.room addHuman:human];
}

- (BOOL)removeHuman:(ALHuman *)human {
    return [self.room removeHuman:human];
}

- (id)humanWithClass:(Class)aClass {
    for (ALHuman *human in self.room.humans){
        if ([human isMemberOfClass:aClass]) {
            
            return human;
        }
    }
    
    return nil;
}

- (id)idleHumanWithClass:(Class)aClass {
    ALRoom *room = self.room;
    
    for (ALHuman *human in room.humans){
        if (!human.busy && [human isMemberOfClass:aClass]) {
            return human;
        }
    }
    
    return nil;
}

@end
