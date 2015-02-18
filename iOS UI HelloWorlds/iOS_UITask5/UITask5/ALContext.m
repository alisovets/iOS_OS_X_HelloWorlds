//
//  ALContext.m
//  UITask5
//
//  Created by Alexander Lisovets on 10/1/14.
//  Copyright (c) 2014 Alexander Lisovets. All rights reserved.
//

#import "ALContext.h"

@implementation ALContext

#pragma mark -
#pragma mark Public

- (void)execute {
    __weak typeof(self) weakSelf = self;
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        __strong typeof (self) strongSelf = weakSelf;
        [strongSelf executeInBackground];
    });
}

- (void)cancel {

}

- (void)executeInBackground {
    
}

@end
