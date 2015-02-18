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
- (void)notifyObserversWithSelectorString:(NSString *)selectorString;

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

- (void)notifyFinishForWorking {
    [self notifyObserversInMainThreadWithSelector:@selector(humanDidFinishWorking:)];
}

- (void)notifyReadyForWorking {
    [self notifyObserversInMainThreadWithSelector:@selector(humanIsReadyForWorking:)];
}

#pragma mark -
#pragma mark Private

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
    [self performSelectorOnMainThread:@selector(notifyObserversWithSelectorString:)
                           withObject:NSStringFromSelector(selector)
                        waitUntilDone:YES];
}

- (void)notifyObserversWithSelectorString:(NSString *)selectorString {
    [self notifyObserversWithSelector:NSSelectorFromString(selectorString)];
}

@end
