//
//  ALWasher.m
//  training task3
//
//  Created by Alexander Lisovets on 8/15/14.
//  Copyright (c) 2014 Alexander Lisovets. All rights reserved.
//

#import "ALWasher.h"
#import "ALCar.h"

static const NSInteger ALDefaultPrice  = 100;

@interface ALWasher()
@property (atomic, retain) ALCar *car;
- (void)takePayment;

@end

@implementation ALWasher

#pragma mark -
#pragma mark Class Methods

+ (ALWasher *)washer {
    return [[[ALWasher alloc] initWithSalary:ALHumanDefaultSalary
                                  experience:ALHumanDefaultExperience
                                   washPrice:ALDefaultPrice ] autorelease];
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
    @synchronized(self) {
        self.busy = YES;
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
            @synchronized(self) {
                [NSThread sleepForTimeInterval:0.1];
                self.car = car;
                NSLog(@"%@ wash %@.", self, car);
                car.washed = YES;
                [self takePayment];
                self.car = nil;
                
                [self notifyFinishForWorking];
            }
        });
    }
}

#pragma mark -
#pragma mark Private

- (void)takePayment {
     @synchronized(self) {
        NSInteger price = self.washPrice;
        NSLog(@"%@ takes $%ld from the %@.", self, price, self.car);
        self.car.moneySupply -= price;
        [self receiveMoneySum:price];
     }
}

@end
