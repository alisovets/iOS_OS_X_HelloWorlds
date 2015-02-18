//
//  ALManager.m
//  training task3
//
//  Created by Alexander Lisovets on 8/15/14.
//  Copyright (c) 2014 Alexander Lisovets. All rights reserved.
//

#import "ALManager.h"

static NSString * const ALManagerDescriptionFormat  = @"Manager(money: %ld)";

@implementation ALManager

#pragma mark -
#pragma mark Class Methods

+ (ALManager *)manager {
    return [[[ALManager alloc] initWithSalary:ALHumanDefaultSalary
                                   experience:ALHumanDefaultExperience] autorelease];
}

#pragma mark -
#pragma mark Public

- (void)makeProfit {
    NSLog(@"The %@ makes the profit.\n-------", self);
    self.busy = NO;
}

- (NSString *)description {
    return  [NSString stringWithFormat:ALManagerDescriptionFormat, self.moneySupply];
}

#pragma mark -
#pragma mark ALObserver

- (void)objectDidFinishProcessing:(ALObservableObject *)anObject {
    ALHuman *human  = (ALHuman *)anObject;
    [self takeMoneyFromHuman: human];
    [self makeProfit];
}

@end
