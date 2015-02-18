//
//  ALWoshBuilding.m
//  training task3
//
//  Created by Alexander Lisovets on 8/15/14.
//  Copyright (c) 2014 Alexander Lisovets. All rights reserved.
//

#import "ALWashBuilding.h"

static const NSInteger ALRoomCountRange         = 10;
static const NSInteger ALMinRoomAmount          = 2;
static const NSInteger ALDefaultWorkplaceCount  = 1;

@interface ALWashBuilding ()
@property (nonatomic, retain) NSMutableArray *mutableCars;

@end

@implementation ALWashBuilding

#pragma mark -
#pragma mark Class Methods

+ (ALWashBuilding *)randomWashBuilding {
    NSInteger roomCount = arc4random_uniform(ALRoomCountRange) + ALMinRoomAmount;
    NSMutableArray *mutableRooms = [[NSMutableArray alloc] initWithCapacity:roomCount];
    for (int index = 0; index < roomCount; index++){
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
    if(![mutableCars containsObject:car]){
        [mutableCars addObject:car];
        NSLog(@"%@ was aded in the Wash Building.", car);
    }
}

- (BOOL)removeCar:(ALCar *)car{
    NSMutableArray *mutableCars = self.mutableCars;
    if ([mutableCars containsObject:car] > 0) {
        [mutableCars removeObject:car];
        
        return YES;
    }
    
    return NO;
}

- (ALCar *)car{
    return [self.mutableCars firstObject];
}

- (ALCar *)dirtyCar{
    ALCar *car = [self car];
    [self removeCar:car];
    return car;
}

@end
