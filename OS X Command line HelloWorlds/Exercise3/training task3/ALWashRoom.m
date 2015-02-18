//
//  ALWoshRoom.m
//  training task3
//
//  Created by Alexander Lisovets on 8/15/14.
//  Copyright (c) 2014 Alexander Lisovets. All rights reserved.
//

#import "ALWashRoom.h"

#import "ALWasher.h"

static const NSInteger ALDefaultHumanPlaceCount     = 1;
static const NSInteger ALDefaultCarPlaceCount       = 3;

@interface ALWashRoom()
@property (nonatomic, retain) NSMutableArray    *mutableCars;
@property (nonatomic, assign) NSInteger         availableCarPlaceCount;

- (BOOL)isCarWaiting:(ALCar *)car;

@end

@implementation ALWashRoom

#pragma mark -
#pragma mark Class Methods

+ (ALWashRoom *)washRoom {
    return [[[ALWashRoom alloc] initWithWorkplaceCount:ALDefaultHumanPlaceCount
                                         carPlaceCount:ALDefaultCarPlaceCount] autorelease];
}

#pragma mark -
#pragma mark Initializations and Deallocations

- (void)dealloc {
    self.mutableCars = nil;
    
    [super dealloc];
}

- (id)initWithWorkplaceCount:(NSInteger)workplaceCount carPlaceCount:(NSInteger) carPlaceCount{
    self = [super initWithWorkplaceCount:workplaceCount];
    if (self) {
        self.mutableCars = [NSMutableArray array];
        self.availableCarPlaceCount = carPlaceCount;
    }
    
    return self;
}

#pragma mark -
#pragma mark Accesors

- (NSArray *)cars {
    return [[self.mutableCars copy] autorelease];
}

#pragma mark -
#pragma mark Public

- (BOOL)addCar:(ALCar *)car{
    NSInteger availableCarPlaceCount = self.availableCarPlaceCount;
    if (availableCarPlaceCount) {
        [self.mutableCars addObject:car];
        self.availableCarPlaceCount = availableCarPlaceCount - 1;
        NSLog(@"%@ was placed in the washroom", car);
        
        return YES;
    }
    
    NSLog(@"%@ was not placed in the washroom. There is no place.", car);
    
    return NO;
}

- (BOOL)removeCar:(ALCar *)car{
    NSInteger availableCarPlaceCount = self.availableCarPlaceCount;
    NSMutableArray *mutableCars = self.mutableCars;
    if ([mutableCars containsObject:car] > 0) {
        [mutableCars removeObject:car];
        self.availableCarPlaceCount = availableCarPlaceCount + 1;
        NSLog(@"%@ was remove from the washroom", car);
        
        return YES;
    }
    
    return NO;
}

- (ALCar *)waitingCar {
    for (ALCar *car in self.cars){
        if ([self isCarWaiting:car]) {
            
            return car;
        }
    }
    
    return nil;
}


#pragma mark -
#pragma mark Private

- (BOOL)isCarWaiting:(ALCar *)car {
    for (ALWasher *washer in self.humans){
        if ([washer.car isEqual:car]) {
            
            return NO;
        }
    }
    
    return YES;
}


@end
