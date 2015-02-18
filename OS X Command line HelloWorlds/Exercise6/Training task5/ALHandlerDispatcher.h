//
//  ALHandlerDispatcher.h
//  Training task6
//
//  Created by Alexander Lisovets on 8/29/14.
//  Copyright (c) 2014 Alexander Lisovets. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ALObserver.h"

@class ALHuman;

@interface ALHandlerDispatcher : NSObject<ALObserver>
@property (atomic, readonly) NSArray *handlers;

+ (id)handlerDispatcher;

- (void)handleOperand:(id)operand;

- (void)addHandler:(ALHuman *)handler;
- (void)removeHandler:(ALHuman *)handler;

@end
