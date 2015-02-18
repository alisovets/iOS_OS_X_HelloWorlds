//
//  ALManager.m
//  training task3
//
//  Created by Alexander Lisovets on 8/15/14.
//  Copyright (c) 2014 Alexander Lisovets. All rights reserved.
//

#import "ALManager.h"

@interface ALManager ()
- (void)workWithHuman:(ALHuman *)human;

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
#pragma mark ALObserver

- (void)humanDidFinishWork:(ALHuman *)human{
        [self workWithHuman:human];
}

#pragma mark -
#pragma mark Private

- (void)workWithHuman:(ALHuman *)human {
     @synchronized(self) {
        self.busy = YES;
        [NSThread sleepForTimeInterval:0.1];
        [self takeMoneyFromHuman:human];
        [human notifyReadyForWorking];
        [self makeProfit];
        self.busy = NO;
     }
}

@end
