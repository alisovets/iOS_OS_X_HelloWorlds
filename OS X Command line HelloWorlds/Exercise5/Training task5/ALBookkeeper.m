//
//  ALBookkeeper.m
//  training task3
//
//  Created by Alexander Lisovets on 8/15/14.
//  Copyright (c) 2014 Alexander Lisovets. All rights reserved.
//

#import "ALBookkeeper.h"

@interface ALBookkeeper ()
- (void)workWithHuman:(ALHuman *)human;

@end

@implementation ALBookkeeper

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
        [self notifyFinishForWorking];
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
    
    self.busy = YES;
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^(void) {
        @synchronized(self) {
            [NSThread sleepForTimeInterval:0.2];
            [self takeMoneyFromHuman:human];
            [human notifyReadyForWorking];
            [self calculate];
        }
    });
    
}

@end
