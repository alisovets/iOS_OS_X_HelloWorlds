//
//  ALObserver.h
//  UITask2
//
//  Created by Alexander Lisovets on 9/9/14.
//  Copyright (c) 2014 Alexander Lisovets. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ALObservable.h"

@protocol ALLocationObserverProtocol <NSObject>
@optional
- (void)locationDidChangeInModel:(id<ALObservable>)model;
- (void)headingDidChangeInModel:(id<ALObservable>)model;

@end

