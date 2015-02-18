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
@property (nonatomic, retain) NSMutableSet *mutableObservers;

@end

@implementation ALObservableObject

#pragma mark -
#pragma mark Initializations and Deallocations

- (void)dealloc {
    self.mutableObservers = nil;
    
    [super dealloc];
}

- (id)init {
    self = [super init];
    if (self) {
        self.mutableObservers = [NSMutableSet set];
    }
    
    return self;
}

#pragma mark -
#pragma mark Public

- (void)registerObserver:(id<ALObserver>)observer {
    [self.mutableObservers addObject:[ALWeakLink weakLinkWithTarget:observer]];
}

- (void)unregisterObserver:(id<ALObserver>)observer {
    [self.mutableObservers removeObject:[ALWeakLink weakLinkWithTarget:observer]];
}

- (void)notifyObservers {
    for (ALWeakLink *weakLink in self.mutableObservers) {
        id<ALObserver> observer = weakLink.target;
        if([observer respondsToSelector:@selector(objectDidFinishProcessing:)]){
            [observer objectDidFinishProcessing:self];
        } else {
            NSLog(@"Observer %@ do not respond to selector: \"objectDidFinishProcessing:\"!", observer);
        }
    }
}

@end
