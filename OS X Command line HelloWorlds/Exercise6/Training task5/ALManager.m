//
//  ALManager.m
//  training task3
//
//  Created by Alexander Lisovets on 8/15/14.
//  Copyright (c) 2014 Alexander Lisovets. All rights reserved.
//

#import "ALManager.h"

static NSString * const ALManagerDescriptionFormat  = @"Manager%@";

@interface ALManager ()

@end

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
    @synchronized(self) {
        NSLog(@"%@ makes the profit.\n-------", self);
    }
}

#pragma mark -
#pragma mark ALHandler

- (void)handleWithOperand:(ALHuman *)human {
    @synchronized(self) {
        self.busy = YES;
        [NSThread sleepForTimeInterval:0.1];
        [self takeMoneyFromHuman:human];
        [human notifyReadyForWorking];
        [self makeProfit];
        self.busy = NO;
        [self notifyReadyForWorking];
    }
}

#pragma mark -
#pragma mark ALObserver

- (void)humanDidFinishWorking:(ALHuman *)human{
        [self handleWithOperand:human];
}

@end
