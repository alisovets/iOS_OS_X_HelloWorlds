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
@property (nonatomic, strong) NSMutableSet *mutableObserverSet;

- (void)notifyObserversWithBlock:(void (^)())block;

@end

@implementation ALObservableObject

#pragma mark -
#pragma mark Initializations and Deallocations

- (id)init {
    self = [super init];
    if (self) {
        self.mutableObserverSet = [NSMutableSet set];
    }
    
    return self;
}

#pragma mark -
#pragma mark Accesors

- (id)target {
    if (_target) {
        return _target;
    }

    return self;
}

- (NSArray *)observerSet {
    NSMutableSet *mutableObserverSet = self.mutableObserverSet;
    @synchronized(mutableObserverSet) {
        return [mutableObserverSet copy];
    }
}

#pragma mark -
#pragma mark Public

- (void)registerObserver:(id)observer {
    NSMutableSet *mutableObserverSet = self.mutableObserverSet;
    @synchronized(mutableObserverSet) {
        [mutableObserverSet addObject:[ALWeakLink weakLinkWithTarget:observer]];
    }
}

- (void)unregisterObserver:(id)observer {
    NSMutableSet *mutableObserverSet = self.mutableObserverSet;
    @synchronized(mutableObserverSet) {
        [mutableObserverSet removeObject:[ALWeakLink weakLinkWithTarget:observer]];
    }
}

- (void)notifyObserversWithSelector:(SEL)selector withObject:(id)object {
    NSMutableSet *mutableObserverSet = self.mutableObserverSet;
    @synchronized(mutableObserverSet) {
        for (ALWeakLink *weakLink in self.mutableObserverSet) {
            id observer = weakLink.target;
            if ([observer respondsToSelector:selector]) {
                [observer performSelector:selector withObject:self.target withObject:object];
            }
        }
    }
}

- (void)notifyObserversInMainThreadWithSelector:(SEL)selector withObject:(id)object {
    SEL mainselector = @selector(notifyObserversWithBlock:);
    
    [self performSelectorOnMainThread:mainselector
                           withObject:^{
                               [self notifyObserversWithSelector:selector
                                                      withObject:object];
                           }
                        waitUntilDone:YES];
}

#pragma mark -
#pragma mark Private

- (void)notifyObserversWithBlock:(void (^)())block {
    block();
}

@end
