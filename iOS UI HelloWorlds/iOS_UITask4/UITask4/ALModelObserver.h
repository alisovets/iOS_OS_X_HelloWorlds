//
//  ALModelObserver.h
//  UITask3
//
//  Created by Alexander Lisovets on 9/15/14.
//  Copyright (c) 2014 Alexander Lisovets. All rights reserved.
//

#import <Foundation/Foundation.h>

@class ALObservableObject;

@protocol ALModelObserver <NSObject>
@optional
- (void)modelDidLoad:(ALObservableObject *)model;
- (void)modelWillLoad:(ALObservableObject *)model;
- (void)modelDidUnload:(ALObservableObject *)model;
- (void)modelDidFail:(ALObservableObject *)model;
- (void)modelDidCancel:(ALObservableObject *)model;

@end
