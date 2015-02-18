//
//  ALEmployee.m
//  training task3
//
//  Created by Alexander Lisovets on 8/15/14.
//  Copyright (c) 2014 Alexander Lisovets. All rights reserved.
//

#import "ALHuman.h"
#import "ALRoom.h"

static NSString * const ALHumanDescriptionFormat  = @"Human(money: %ld)";

@interface ALHuman()
@property (nonatomic, assign) NSInteger moneySupply;

@end

@implementation ALHuman

#pragma mark -
#pragma mark Initializations and Deallocations

- (void)dealloc {
    self.room = nil;
    
    [super dealloc];
}

- (id)initWithSalary:(NSInteger)salary experience:(NSInteger)experience {
    self = [super init];
    if (self){
        self.salary = salary;
        self.experience = experience;
        self.moneySupply = 0;
        self.busy = NO;
        self.room = nil;
    }
    
    return self;
}

#pragma mark -
#pragma mark Public

- (void)giveMoneyToHuman:(ALHuman *)human {
    NSInteger moneySum = self.moneySupply;
    NSLog(@"%@ gives $%ld to %@.", self, moneySum, human);
    [human receiveMoneySum:moneySum];
    self.moneySupply = 0;
    self.busy = NO;
}

- (void)receiveMoneySum:(NSInteger)moneySum {
    self.busy = YES;
    NSLog(@"%@ receives $%ld.", self, moneySum);
    self.moneySupply += moneySum;
}

- (NSString *)description {
    return  [NSString stringWithFormat:ALHumanDescriptionFormat, self.moneySupply];
}

@end
