//
//  ALModelObserver.h
//  UITask3
//
//  Created by Alexander Lisovets on 9/15/14.
//  Copyright (c) 2014 Alexander Lisovets. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ALObservableModel.h"

@protocol ALModelObserver <NSObject>
@optional
- (void)modelDidLoad:(id<ALObservableModel>)model;
- (void)modelWillLoad:(id<ALObservableModel>)model;
- (void)modelDidPartlyLoad:(id<ALObservableModel>)model;
- (void)modelDidUnload:(id<ALObservableModel>)model;
- (void)modelDidFail:(id<ALObservableModel>)model;
- (void)modelDidCancel:(id<ALObservableModel>)model;

@end
