//
//  ALObservableObject.h
//  training task4
//
//  Created by Alexander Lisovets on 8/21/14.
//  Copyright (c) 2014 Alexander Lisovets. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ALObservable.h"

@interface ALObservableObject : NSObject<ALObservable>
@property (nonatomic, weak) id  target;
@property (nonatomic, readonly) NSSet *observerSet;

- (void)registerObserver:(id)observer;
- (void)unregisterObserver:(id)observer;

- (void)notifyObserversWithSelector:(SEL)selector withObject:(id)object;
- (void)notifyObserversInMainThreadWithSelector:(SEL)selector withObject:(id)object;

@end
