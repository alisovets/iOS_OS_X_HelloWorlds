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
    @synchronized(self){
        NSLog(@"%@ calculates money.", self);
        [self notifyFinishForWorking];
    }
}

- (void)handleWithOperand:(ALHuman *)human {
    self.busy = YES;
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^(void){
        @synchronized(self) {
            [NSThread sleepForTimeInterval:0.1];
            [self takeMoneyFromHuman:human];
            [human notifyReadyForWorking];
            [self calculate];
        }
    });
}

@end
