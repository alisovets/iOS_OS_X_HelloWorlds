//
//  ALRoom.m
//  training task3
//
//  Created by Alexander Lisovets on 8/15/14.
//  Copyright (c) 2014 Alexander Lisovets. All rights reserved.
//

#import "ALRoom.h"

static const NSInteger ALDefaultPlaceCount   = 2;

@interface ALRoom ()
@property (nonatomic, retain) NSMutableArray    *mutableHumans;
@property (nonatomic, assign) NSInteger         vacantWorkplaceCount;


@end

@implementation ALRoom

#pragma mark -
#pragma mark Class Methods

+ (ALRoom *)room {
    return [[[ALRoom alloc] initWithWorkplaceCount:ALDefaultPlaceCount ] autorelease];
}

#pragma mark -
#pragma mark Initializations and Deallocations

- (void)dealloc {
    self.mutableHumans = nil;
    
    [super dealloc];
}

- (id)initWithWorkplaceCount:(NSInteger)workplaceCount{
    self = [super init];
    if (self) {
        self.mutableHumans = [NSMutableArray array];
        self.vacantWorkplaceCount = workplaceCount;
    }
    
    return self;
}

#pragma mark -
#pragma mark Accesors

- (NSArray *)humans {
    return [[self.mutableHumans copy] autorelease];
}

#pragma mark -
#pragma mark Public

- (BOOL)addHuman:(ALHuman *)human{
    NSInteger vacantWorcplaceCount = self.vacantWorkplaceCount;
    if (vacantWorcplaceCount) {
        [self.mutableHumans addObject:human];
        human.room = self;
        self.vacantWorkplaceCount = --vacantWorcplaceCount;
        NSLog(@"%@ was added in the room", human);
        
        return YES;
    }
    
    NSLog(@"%@ was not added in the room. There is no place.", human);
    
    return NO;
}

- (BOOL)removeHuman:(ALHuman *)human{
    NSMutableArray *mutableHumen = self.mutableHumans;
    if ([mutableHumen containsObject:human] > 0) {
        [mutableHumen removeObject:human];
        human.room = nil;
        self.vacantWorkplaceCount++;
        NSLog(@"%@ was removed from the room", human);
        
        return YES;
    }
    
    return NO;
}

@end
