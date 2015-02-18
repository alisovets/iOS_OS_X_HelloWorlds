//
//  ALObservableObject.m
//  training task4
//
//  Created by Alexander Lisovets on 8/21/14.
//  Copyright (c) 2014 Alexander Lisovets. All rights reserved.
//

#import "ALObservableObject.h"

#import "ALWeakLink.h"

@interface ALObservableObject ()
@property (nonatomic, retain) NSMutableSet *mutableObserverSet;
- (void)notifyObserversWithSelector:(SEL)selector;
- (void)notifyObserversInMainThreadWithSelector:(SEL)selector;

@end

@implementation ALObservableObject

#pragma mark -
#pragma mark Initializations and Deallocations

- (void)dealloc {
    self.mutableObserverSet = nil;
    
    [super dealloc];
}

- (id)init {
    self = [super init];
    if (self) {
        self.mutableObserverSet = [NSMutableSet set];
    }
    
    return self;
}

#pragma mark -
#pragma mark Accesors

- (NSArray *)observerSet {
    NSMutableSet *mutableObserverSet = self.mutableObserverSet;
    @synchronized(mutableObserverSet) {
        return [[mutableObserverSet copy] autorelease];
    }
}

#pragma mark -
#pragma mark Public

- (void)registerObserver:(id<ALObserver>)observer {
    NSMutableSet *mutableObserverSet = self.mutableObserverSet;
    @synchronized(mutableObserverSet) {
        [mutableObserverSet addObject:[ALWeakLink weakLinkWithTarget:observer]];
    }
}

- (void)unregisterObserver:(id<ALObserver>)observer {
    NSMutableSet *mutableObserverSet = self.mutableObserverSet;
    @synchronized(mutableObserverSet) {
        [mutableObserverSet removeObject:[ALWeakLink weakLinkWithTarget:observer]];
    }
}

- (void)notifyObserversWithSelector:(SEL)selector {
    NSMutableSet *mutableObserverSet = self.mutableObserverSet;
    @synchronized(mutableObserverSet) {
        for (ALWeakLink *weakLink in self.mutableObserverSet) {
            id<ALObserver> observer = weakLink.target;
            if ([observer respondsToSelector:selector]) {
                [observer performSelector:selector withObject:self];
            }
        }
    }
}

- (void)notifyObserversInMainThreadWithSelector:(SEL)selector {
    dispatch_block_t block = ^{
        [self notifyObserversWithSelector:selector];
    };
    
    if ([NSThread isMainThread]) {
        block();
    } else {
        dispatch_sync(dispatch_get_main_queue(), block);
    }
}

- (void)notifyFinishForWorking {
    [self notifyObserversInMainThreadWithSelector:@selector(humanDidFinishWorking:)];
}

- (void)notifyReadyForWorking {
    [self notifyObserversInMainThreadWithSelector:@selector(humanIsReadyForWorking:)];
}

@end
