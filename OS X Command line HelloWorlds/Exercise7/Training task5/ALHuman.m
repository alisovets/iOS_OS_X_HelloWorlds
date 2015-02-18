//
//  ALEmployee.m
//  training task3
//
//  Created by Alexander Lisovets on 8/15/14.
//  Copyright (c) 2014 Alexander Lisovets. All rights reserved.
//

#import "ALHuman.h"
#import "ALRoom.h"

static NSString * const ALHumanDescriptionFormat                = @"%@(money: %ld)";
static NSString * const ALUnimplementedMethodExceptionName      = @"UnimplementedMethodException";
static NSString * const ALUnimplementedMethodExceptionReason    = @"The metod must be overridden in"
                                                                  " descendants";


@interface ALHuman()
@property (atomic, assign) NSInteger moneySupply;
- (void)workWithOperandInBackground:(id)operand;
- (void)workWithOperandInForeground:(id)operand;

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
    if (self) {
        self.salary = salary;
        self.experience = experience;
        self.moneySupply = 0;
        self.room = nil;
        self.busy = NO;
    }
    
    return self;
}

#pragma mark -
#pragma mark Public

- (NSInteger)giveMoney {
        NSInteger moneySum = self.moneySupply;
        NSLog(@"The %@ give $%ld.", self, moneySum);
        self.moneySupply = 0;
        return moneySum;
}

- (void)receiveMoneySum:(NSInteger)moneySum {
    @synchronized(self) {
        NSLog(@"%@ receives $%ld.", self, moneySum);
        self.moneySupply += moneySum;
    }
}

- (void)takeMoneyFromHuman:(ALHuman *)human {
    @synchronized(self) {
        NSInteger moneySum = [human giveMoney];
        NSLog(@"%@ takes $%ld from %@.", self, moneySum, human);
        [self receiveMoneySum:moneySum];
    }
}

- (void)handleOperandInBackground:(id)operand {

}

- (void)handleOperandInForeground:(id)operand {

}

- (NSString *)description {
        return  [NSString stringWithFormat:ALHumanDescriptionFormat, [super description],
                 self.moneySupply];
}

#pragma mark -
#pragma mark ALHandler

- (void)handleOperand:(id)operand {
    self.busy = YES;
    [self performSelectorInBackground:@selector(workWithOperandInBackground:)withObject:operand];
}

#pragma mark -
#pragma mark Private

- (void)workWithOperandInBackground:(id)operand {
    [self handleOperandInBackground:operand];
    [self performSelectorOnMainThread:@selector(workWithOperandInForeground:)
                           withObject:operand
                        waitUntilDone:YES];
}

- (void)workWithOperandInForeground:(id)operand {
    [self handleOperandInForeground:(id)operand];
    [self notifyFinishForWorking];
}

@end
