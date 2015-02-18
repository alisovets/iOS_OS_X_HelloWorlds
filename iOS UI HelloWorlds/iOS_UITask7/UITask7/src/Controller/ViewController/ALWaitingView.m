//
//  ALWaitingView.m
//  UITask3
//
//  Created by Alexander Lisovets on 9/12/14.
//  Copyright (c) 2014 Alexander Lisovets. All rights reserved.
//

#import "ALWaitingView.h"
#include "NSBundle+ALExtension.h"

static const NSTimeInterval ALMaxAnimationAlpha     = 1.0;
static const NSTimeInterval ALMinAnimationAlpha     = 0.0;
static const NSTimeInterval ALAnimationDelay        = 0.0;
static const NSTimeInterval ALAnimationDuration     = 0.3;

@interface ALWaitingView ()
@property (nonatomic, assign) BOOL visible;

- (void)animateFromAlpha:(CGFloat)fromAlpha
                 toAlpha:(CGFloat)toAlpha
              completion:(void (^)(BOOL finished))completion;

@end

@implementation ALWaitingView

#pragma mark -
#pragma mark Class Methods

+ (id)waitingViewOnSuperview:(UIView *)superview {
    ALWaitingView *waitingView = [NSBundle objectWithClass:[self class]];
    [superview addSubview:waitingView];
    
    return waitingView;
}

#pragma mark -
#pragma mark Public

- (void)willMoveToSuperview:(UIView *)newSuperview{
    self.frame = newSuperview.bounds;
    [super willMoveToSuperview:newSuperview];
}

- (void)show {
    self.visible = YES;
    [self animateFromAlpha:ALMinAnimationAlpha toAlpha:ALMaxAnimationAlpha completion:nil];
}

- (void)hide {
    [self animateFromAlpha:ALMaxAnimationAlpha
                   toAlpha:ALMinAnimationAlpha
                completion:^(BOOL finished) {
                    self.hidden = YES;
                    [self.activityIndicatorView stopAnimating];
                    [self removeFromSuperview];
                    self.visible = NO;
                }];
}

#pragma mark -
#pragma mark Private

- (void)animateFromAlpha:(CGFloat)fromAlpha
                 toAlpha:(CGFloat)toAlpha
              completion:(void (^)(BOOL finished))completion
{
    self.alpha = fromAlpha;
    self.hidden = NO;
    [self.activityIndicatorView startAnimating];
    [UIView animateWithDuration:ALAnimationDuration
                          delay:ALAnimationDelay
                        options:UIViewAnimationOptionBeginFromCurrentState
                     animations:^{
                         self.alpha = toAlpha;
                     }
                     completion:completion];
}

@end
