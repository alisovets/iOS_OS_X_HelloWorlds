//
//  ALRootView.m
//  UITask2
//
//  Created by Alexander Lisovets on 9/5/14.
//  Copyright (c) 2014 Alexander Lisovets. All rights reserved.
//

#import "ALAbstractRootView.h"
#import "ALWaitingView.h"

@interface ALAbstractRootView ()
@property (nonatomic, strong)   ALWaitingView   *waitingView;
@property (nonatomic, assign)   BOOL            waitingViewVisible;

@end

@implementation ALAbstractRootView

#pragma mark -
#pragma mark Public

- (void)showWaitingView {
    if (!self.waitingViewVisible) {
        self.waitingViewVisible = YES;
        self.waitingView = [ALWaitingView waitingViewOnSuperview: self];
        [self.waitingView show];
    }
}

- (void)hideWaitingView {
    if (self.waitingViewVisible) {
        [self.waitingView hide];
        self.waitingViewVisible = NO;
        self.waitingView = nil;
    }
}

@end
