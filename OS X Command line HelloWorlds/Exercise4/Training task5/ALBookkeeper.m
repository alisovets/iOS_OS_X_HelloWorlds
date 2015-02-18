//
//  ALBookkeeper.m
//  training task3
//
//  Created by Alexander Lisovets on 8/15/14.
//  Copyright (c) 2014 Alexander Lisovets. All rights reserved.
//

#import "ALBookkeeper.h"

@implementation ALBookkeeper

static NSString * const ALBookkeeperDescriptionFormat  = @"Bookkeeper(money: %ld)";

#pragma mark -
#pragma mark Class Methods

+ (ALBookkeeper *)bookkeeper {
    return [[[ALBookkeeper alloc] initWithSalary:ALHumanDefaultSalary
                                      experience:ALHumanDefaultExperience] autorelease];
}

#pragma mark -
#pragma mark Public

- (void)calculate {
    NSLog(@"The %@ calcualtes the money.", self);
    [self notifyObservers];
}

- (NSString *)description {
    return  [NSString stringWithFormat:ALBookkeeperDescriptionFormat, self.moneySupply];
}

#pragma mark -
#pragma mark ALObserver

- (void)objectDidFinishProcessing:(ALObservableObject *)anObject {
    ALHuman *human  = (ALHuman *)anObject;
    [self takeMoneyFromHuman:human];
    [self calculate];
}

@end
