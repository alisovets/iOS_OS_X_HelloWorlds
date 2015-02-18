//
//  ALWoshBuilding.m
//  training task3
//
//  Created by Alexander Lisovets on 8/15/14.
//  Copyright (c) 2014 Alexander Lisovets. All rights reserved.
//

#import "ALWashBuilding.h"

static const NSInteger ALRoomAmount             = 20;
static const NSInteger ALDefaultWorkplaceCount  = 1;

@interface ALWashBuilding ()
@property (nonatomic, retain) NSMutableArray *mutableCars;
@end

@implementation ALWashBuilding

#pragma mark -
#pragma mark Class Methods

+ (ALWashBuilding *)washBuilding {
    NSMutableArray *mutableRooms = [[NSMutableArray alloc] initWithCapacity:ALRoomAmount];
    for (int index = 0; index < ALRoomAmount; index++) {
            ALRoom *washRoom = [ALRoom roomWithWorkplaceCount:ALDefaultWorkplaceCount];
            [mutableRooms addObject:washRoom];
    }
    
    ALWashBuilding *washBuilding = [[[ALWashBuilding alloc] initWithRooms:mutableRooms] autorelease];
    [mutableRooms release];
    
    return washBuilding;
}

#pragma mark -
#pragma mark Initializations and Deallocations

- (void)dealloc {
    self.mutableCars = nil;
    
    [super dealloc];
}



- (id)initWithRooms:(NSArray *)rooms {
    self = [super initWithRooms:rooms];
    if (self) {
        self.mutableCars = [NSMutableArray array];
    }
    
    return self;
}

#pragma mark -
#pragma mark Public

- (void)addCar:(ALCar *)car{
    NSMutableArray *mutableCars = self.mutableCars;
    @synchronized(mutableCars){
        if(![mutableCars containsObject:car]){
            [mutableCars addObject:car];
            NSLog(@"%@ was aded in the queue.", car);
        }
    }
}

- (BOOL)removeCar:(ALCar *)car{
    NSMutableArray *mutableCars = self.mutableCars;
    @synchronized(mutableCars){
        if ([mutableCars containsObject:car] > 0) {
            [mutableCars removeObject:car];
            
            return YES;
        }
    
        return NO;
    }
}

- (ALCar *)car{
    NSMutableArray *mutableCars = self.mutableCars;
    @synchronized(mutableCars){
        return [mutableCars firstObject];
    }
}

- (ALCar *)dirtyCar{
    @synchronized(self.mutableCars){
        ALCar *car = [self car];
        [self removeCar:car];
        
        return car;
    }
}

@end

