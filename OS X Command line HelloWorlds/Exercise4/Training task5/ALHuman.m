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

- (NSInteger)giveMoney {
    NSInteger moneySum = self.moneySupply;
    NSLog(@"The %@ give $%ld.", self, moneySum);
    self.moneySupply = 0;
    self.busy = NO;
    return moneySum;
}

- (void)receiveMoneySum:(NSInteger)moneySum {
    NSLog(@"%@ receives $%ld.", self, moneySum);
    self.moneySupply += moneySum;
}

- (void)takeMoneyFromHuman:(ALHuman *)human {
    self.busy = YES;
    NSInteger moneySum = [human giveMoney];
    NSLog(@"The %@ takes $%ld from the %@.", self, moneySum, human);
    [self receiveMoneySum:moneySum];
}

- (NSString *)description {
    return  [NSString stringWithFormat:ALHumanDescriptionFormat, self.moneySupply];
}

#pragma mark -
#pragma mark ALObserver

- (void)objectDidFinishProcess:(ALObservableObject *)anObject {
    
}


@end
