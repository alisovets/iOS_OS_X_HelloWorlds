//
//  ALAnimationViewController.m
//  UITask1
//
//  Created by Alexander Lisovets on 9/4/14.
//  Copyright (c) 2014 Alexander Lisovets. All rights reserved.
//

#import "ALAnimationViewController.h"

@interface ALAnimationViewController ()

@end

@implementation ALAnimationViewController

@dynamic rootView;

#pragma mark -
#pragma mark Accessors

- (ALAnimationView *)rootView {
    UIView *view = self.view;
    if (view && [view isKindOfClass:[ALAnimationView class]]) {
        return (ALAnimationView *)view;
    }
    
    return nil;
}

#pragma mark -
#pragma mark Public

- (IBAction)animate:(id)sender {
    [self.rootView animate];
}

@end
