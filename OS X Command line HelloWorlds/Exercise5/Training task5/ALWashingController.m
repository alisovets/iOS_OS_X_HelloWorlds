//
//  ALWashingController.m
//  Training task5
//
//  Created by Alexander Lisovets on 8/27/14.
//  Copyright (c) 2014 Alexander Lisovets. All rights reserved.
//

#import "ALWashingController.h"

#import "ALCar.h"
#import "ALWashBuilding.h"
#import "ALAdministrativeBuilding.h"

static const NSInteger ALDefaultCarAmount = 17;

@interface ALWashingController ()
@property (nonatomic, retain) ALWashBuilding            *washBuilding;
@property (nonatomic, retain) ALAdministrativeBuilding  *administrativeBuilding;
@property (nonatomic, retain) NSMutableArray            *cars;
@property (nonatomic, retain) NSMutableArray            *washers;
@property (nonatomic, retain) ALBookkeeper              *bookkeeper;
@property (nonatomic, retain) ALManager                 *manager;

- (void)addWashers;
- (void)registerObservers;
- (void)unregisterObservers;
- (void)registerObserversWithSelector:(SEL)selector;
- (void)addCars;

@end

@implementation ALWashingController

#pragma mark -
#pragma mark Class Methods

+ (id) controller {
    ALAdministrativeBuilding * administrativeBuilding = [ALAdministrativeBuilding
                                                         administrativeBuilding];
    ALWashBuilding *washBuilding = [ALWashBuilding washBuilding];
    ALWashingController *controller = [[[ALWashingController alloc]
                                        initWithAdministrativeBilding:administrativeBuilding
                                        washBuilding:washBuilding] autorelease];
    [controller addCars];
    
    return controller;
}

#pragma mark -
#pragma mark Initializations and Deallocations

- (void)dealloc {
    [self unregisterObservers];
    self.administrativeBuilding = nil;
    self.washBuilding = nil;
    self.cars = nil;
    self.washers = nil;
    self.bookkeeper = nil;
    self.manager = nil;

    [super dealloc];
}

- (id)initWithAdministrativeBilding:(ALAdministrativeBuilding *)administrativeBuilding
                      washBuilding:(ALWashBuilding *)washBuilding;
{
    self = [super init];
    if (self) {
        self.administrativeBuilding = administrativeBuilding;
        self.washBuilding = washBuilding;
        self.cars = [NSMutableArray array];
        self.washers = [NSMutableArray array];
        ALManager *manager = [ALManager manager];
        self.manager = manager;
        ALBookkeeper *bookkeeper = [ALBookkeeper bookkeeper];
        self.bookkeeper = bookkeeper;
        [bookkeeper registerObserver:manager];
        [administrativeBuilding addHuman:manager];
        [administrativeBuilding addHuman:bookkeeper];
        [self addWashers];
        [self registerObservers];
    }
    
    return self;
}

#pragma mark -
#pragma mark Public

- (void)run {
    for (ALWasher *washer in self.washers) {
        [self humanIsReadyForWork:washer];
    }
    
    NSRunLoop *loop = [NSRunLoop currentRunLoop];
    [loop run];
}

#pragma mark -
#pragma mark ALObserver

- (void)humanIsReadyForWork:(ALHuman *)human {
    NSMutableArray *cars = self.cars;
    @synchronized(cars) {
        ALWasher *washer = (ALWasher *)human;
        ALCar *car = [cars firstObject];
        if (car) {
            [cars removeObject:car];
            [washer washCar:car];
        }
    }
}

#pragma mark -
#pragma mark Private

- (void)addWashers {
    NSInteger washerCount = [self.washBuilding.rooms count];
    for (NSInteger index = 0; index < washerCount; index++) {
        ALWasher *washer = [ALWasher washer];
        [self.washBuilding addHuman:washer];
        [self.washers addObject:washer];
    }
}

- (void)registerObservers {
    [self registerObserversWithSelector:@selector(registerObserver:)];
}

- (void)unregisterObservers {
    [self registerObserversWithSelector:@selector(unregisterObserver:)];
}

- (void)registerObserversWithSelector:(SEL)selector {
    ALBookkeeper *bookkeeper = self.bookkeeper;
    for (ALWasher *washer in self.washers) {
        [washer performSelector:selector withObject:bookkeeper];
        [washer performSelector:selector withObject:self];
    }
    
    [bookkeeper performSelector:selector withObject:self.manager];
}


- (void)addCars {
    for (NSInteger index = 0; index < ALDefaultCarAmount; index++) {
        [self.cars addObject:[ALCar car]];
    }
}

@end
