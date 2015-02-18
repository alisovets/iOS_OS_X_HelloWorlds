//
//  ALCar.m
//  training task3
//
//  Created by Alexander Lisovets on 8/15/14.
//  Copyright (c) 2014 Alexander Lisovets. All rights reserved.
//

#import "ALCar.h"

static NSString * const ALCarDescriptionFormat = @"Car(money: $%ld, washed: %@)";

static const NSInteger ALDefaultMoneySum    = 200;

@implementation ALCar

#pragma mark -
#pragma mark Class Methods

+ (ALCar *)car {
    return [[[ALCar alloc] initWithMoney:ALDefaultMoneySum] autorelease];
}

#pragma mark -
#pragma mark Initializations

- (id)initWithMoney:(NSInteger)sum {
    self = [super init];
    if (self) {
        self.washed = NO;
        self.moneySupply = sum;
    }
    
    return self;
}

#pragma mark -
#pragma mark Public

- (void)paySum:(NSInteger)sum{
    NSLog(@"%@ pays $%ld", self, sum);
    self.moneySupply -= sum;
}

- (NSString *)description {
    return  [NSString stringWithFormat:ALCarDescriptionFormat, self.moneySupply, self.washed ? @"YES" : @"NO"];
}

@end
