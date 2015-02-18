//
//  ALRoom.m
//  training task3
//
//  Created by Alexander Lisovets on 8/15/14.
//  Copyright (c) 2014 Alexander Lisovets. All rights reserved.
//

#import "ALRoom.h"

@interface ALRoom ()
@property (nonatomic, retain) NSMutableArray    *mutableHumans;
@property (nonatomic, assign) NSInteger         vacantWorkplaceCount;

@end

@implementation ALRoom

#pragma mark -
#pragma mark Class Methods

+ (ALRoom *)roomWithWorkplaceCount:(NSInteger)workplaceCount {
    return [[[ALRoom alloc] initWithWorkplaceCount:workplaceCount ] autorelease];
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
    NSMutableArray *mutableHumans = self.mutableHumans;
    @synchronized(mutableHumans){
        return [[mutableHumans copy] autorelease];
    }
}

#pragma mark -
#pragma mark Public

- (BOOL)addHuman:(ALHuman *)human{
    NSMutableArray *mutableHumans = self.mutableHumans;
    @synchronized(mutableHumans){
        NSInteger vacantWorkplaceCount = self.vacantWorkplaceCount;
        if (vacantWorkplaceCount) {
            [mutableHumans addObject:human];
            human.room = self;
            self.vacantWorkplaceCount = --vacantWorkplaceCount;
            NSLog(@"%@ was added in the room", human);
            
            return YES;
        }
        
        return NO;
    }
}

- (BOOL)removeHuman:(ALHuman *)human{
    NSMutableArray *mutableHumans = self.mutableHumans;
    @synchronized(mutableHumans){
        if ([mutableHumans containsObject:human]) {
            [mutableHumans removeObject:human];
            human.room = nil;
            self.vacantWorkplaceCount++;
            NSLog(@"%@ was removed from the room", human);
            
            return YES;
        }
        
        return NO;
    }
}

@end
