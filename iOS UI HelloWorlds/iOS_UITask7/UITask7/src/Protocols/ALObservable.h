//
//  ALObservable.h
//  UITask6
//
//  Created by Alexander Lisovets on 10/21/14.
//  Copyright (c) 2014 Alexander Lisovets. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol ALObservable <NSObject>
@optional
- (void)registerObserver:(id)observer;
- (void)unregisterObserver:(id)observer;

- (void)notifyObserversWithSelector:(SEL)selector withObject:(id)object;
- (void)notifyObserversInMainThreadWithSelector:(SEL)selector withObject:(id)object;

@end
