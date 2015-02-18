//
//  ALWasher.m
//  training task3
//
//  Created by Alexander Lisovets on 8/15/14.
//  Copyright (c) 2014 Alexander Lisovets. All rights reserved.
//

#import "ALWasher.h"
#import "ALCar.h"
#import "ALWashRoom.h"

static NSString * const ALWasherDescriptionFormat  = @"Washer(money: %ld)";

static const NSInteger ALDefaultRate        = 100;

@interface ALWasher()
@property (nonatomic, retain) ALCar *car;
- (BOOL)receiveCar:(ALCar *)car;
- (BOOL)receivePayment;
- (void)dismissCar;

@end

@implementation ALWasher

#pragma mark -
#pragma mark Class Methods

+ (ALWasher *)washer {
    return [[[ALWasher alloc] initWithSalary:ALHumanDefaultSalary
                                  experience:ALHumanDefaultExperience 
                                    washPrice:ALDefaultRate ] autorelease];
}

#pragma mark -
#pragma mark Initializations and Deallocations

- (void)dealloc {
    self.car = nil;
    
    [super dealloc];
}

- (id)initWithSalary:(NSInteger)salary
          experience:(NSInteger)experience
            washPrice:(NSInteger)washPrice
{
    self = [super initWithSalary:salary experience:experience];
    if (self) {
        self.car = nil;
        self.washPrice = washPrice;
    }
    
    return self;
}

#pragma mark -
#pragma mark Public

-(void)washCar:(ALCar *)car{
    if (![self receiveCar:car]){
        return;
    }
    
    car.washed = YES;
    NSLog(@"The %@ has washed the %@.", self, car);
    [self receivePayment];
}

#pragma mark -
#pragma mark Private

- (BOOL)receiveCar:(ALCar *)car {
    if (self.busy) {
        
        return NO;
    }

    self.busy = YES;
    self.car = car;
    NSLog(@"The %@ has received a %@.", self, car);
    
    return YES;
}

- (BOOL)receivePayment {
    ALCar *car = self.car;
    
    if (!car) {
        
        return NO;
    }
    
    NSInteger washPrice = self.washPrice;
    [car paySum:washPrice];
    [self receiveMoneySum:washPrice];
    [self dismissCar];
    
    return YES;
}

- (void)dismissCar {
    
    ALWashRoom *washRoom = (ALWashRoom *)self.room;
    [washRoom removeCar:self.car];
    NSLog(@"%@ has dismiss the %@.", self, self.car);
    self.car = nil;
}

- (NSString *)description {
    return  [NSString stringWithFormat:ALWasherDescriptionFormat, self.moneySupply];
}

@end
