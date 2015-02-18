//
//  ALBookkeeper.m
//  training task3
//
//  Created by Alexander Lisovets on 8/15/14.
//  Copyright (c) 2014 Alexander Lisovets. All rights reserved.
//

#import "ALBookkeeper.h"

@implementation ALBookkeeper

static NSString * const ALBookkeeperDescriptionFormat  = @"Bookkeeper%@";

#pragma mark -
#pragma mark Class Methods

+ (ALBookkeeper *)bookkeeper {
    return [[[ALBookkeeper alloc] initWithSalary:ALHumanDefaultSalary
                                      experience:ALHumanDefaultExperience] autorelease];
}

#pragma mark -
#pragma mark Public

- (void)calculate {
    @synchronized(self) {
        NSLog(@"%@ calculates money.", self);
    }
}

- (void)handleOperandInBackground:(ALHuman *)human {
    @synchronized(self) {
        [NSThread sleepForTimeInterval:0.1];
        [self takeMoneyFromHuman:human];
        human.busy = NO;
        [human notifyReadyForWorking];
        [self calculate];
    }
}

@end
