//
//  ALHandlerDispatcher.m
//  Training task6
//
//  Created by Alexander Lisovets on 8/29/14.
//  Copyright (c) 2014 Alexander Lisovets. All rights reserved.
//

#import "ALHandlerDispatcher.h"
#import "ALHuman.h"

@interface ALHandlerDispatcher ()
@property (atomic, retain) NSMutableArray *mutableHandlers;
@property (atomic, retain) NSMutableArray *operands;

- (ALHuman *)idleHandler;

- (void)addOperand:(id)operand;
- (void)removeOperand:(id)operand;
- (id)operand;

@end

@implementation ALHandlerDispatcher

+ (id)handlerDispatcher {
    return [[[ALHandlerDispatcher alloc] init] autorelease];
}

#pragma mark -
#pragma mark Initializations and Deallocations

- (void)dealloc {
    self.mutableHandlers = nil;
    self.operands = nil;
    
    [super dealloc];
}

- (id)init {
    self = [super init];
    if (self) {
        self.mutableHandlers = [NSMutableArray array];
        self.operands = [NSMutableArray array];
    }
    
    return self;
}

#pragma mark -
#pragma mark Accesors

- (NSArray *)handlers {
    NSMutableArray *mutableHandlers = self.mutableHandlers;
    @synchronized(mutableHandlers) {
        return [[mutableHandlers copy] autorelease];
    }
}

#pragma mark -
#pragma mark Public

- (void)handleOperand:(id)operand {
    @synchronized(self.mutableHandlers){
        ALHuman *handler = [self idleHandler];
        if (handler) {
            [handler handleWithOperand:operand];
        } else {
            [self addOperand:operand];
        }
    }
}

- (void)addHandler:(ALHuman *)handler {
    NSMutableArray *handlers = self.mutableHandlers;
    @synchronized(handlers){
        if (![handlers containsObject:handlers]) {
            [handlers addObject:handler];
        }
    }
}

- (void)removeHandler:(ALHuman *)handler {
    NSMutableArray *handlers = self.mutableHandlers;
    @synchronized(handlers){
        [handlers removeObject:handler];
    }
}

#pragma mark -
#pragma mark ALObserver

- (void)humanIsReadyForWorking:(ALHuman *)human {
    id operand = [self operand];
    if (operand) {
        [human handleWithOperand:operand];
    }
}

#pragma mark -
#pragma mark Private

- (ALHuman *)idleHandler {
    NSMutableArray *handlers = self.mutableHandlers;
    @synchronized(handlers){
        for (ALHuman *handler in handlers) {
            if (!handler.busy) {
                return handler;
            }
        }
    }
    
    return nil;
}

- (void)addOperand:(id)operand {
    NSMutableArray *operands = self.operands;
    @synchronized(operands){
        if (![operands containsObject:operand]) {
            [operands addObject:operand];
        }
    }
}

- (void)removeOperand:(id)operand {
    NSMutableArray *operands = self.operands;
    @synchronized(operands){
        [operands removeObject:operand];
    }
}

- (id)operand {
    NSMutableArray *operands = self.operands;
    @synchronized(operands){
        id operand = [operands firstObject];
        [self removeOperand:operand];
        
        return operand;
    }
}

@end
