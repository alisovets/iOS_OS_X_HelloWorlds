//
//  ALAnimationView.m
//  UITask1
//
//  Created by Alexander Lisovets on 9/4/14.
//  Copyright (c) 2014 Alexander Lisovets. All rights reserved.
//

#import "ALAnimationView.h"

static const NSTimeInterval ALAnimationDelay        = 0;
static const NSTimeInterval ALAnimationDuration     = 1.2;
static const NSTimeInterval ALNonAnimationDuration  = 0;

@interface ALAnimationView ()
@property (nonatomic, assign) ALViewPosition position;

- (void)executeAnimation;
- (ALViewPosition)positionForCurentPosition;
- (CGRect)frameViewForPosition:(ALViewPosition)position;

@end

@implementation ALAnimationView

#pragma mark -
#pragma mark Initializations and Deallocations

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.position = ALTopLeftPosition;
        self.animating = NO;
    }
    return self;
}

#pragma mark -
#pragma mark Public
- (void)animate {
    return self.animating ? [self stopAnimation] : [self startAnimation];
}

#pragma mark -
#pragma mark Private

- (void)startAnimation {
    self.animating = YES;
    [self executeAnimation];
}

- (void)stopAnimation {
    self.animating = NO;
}

- (void)setPosition:(ALViewPosition)position animated:(BOOL)animated {
    [self setPosition:position animated:animated completionHandler:nil];
}

- (void)setPosition:(ALViewPosition)position
                 animated:(BOOL)animated
        completionHandler:(void (^)(BOOL))completionHandler
{
    NSTimeInterval duration = animated ? ALAnimationDuration : ALNonAnimationDuration;
    
    [UIView animateWithDuration:duration
                          delay:ALAnimationDelay
                        options:UIViewAnimationOptionBeginFromCurrentState
                     animations:^{
                         self.squareView.frame = [self frameViewForPosition:self.position];
                     }
                     completion:^(BOOL finished) {
                         _position = position;
                         
                        if (completionHandler) {
                             completionHandler(finished);
                         }
                     }];

}

- (void)executeAnimation {
    void(^completionHandler)(BOOL) = ^(BOOL finished) {
        if (finished && self.animating) {
            [self executeAnimation];
        }
    };
    
    [self setPosition:[self positionForCurentPosition] animated:YES completionHandler:completionHandler];
}

- (ALViewPosition)positionForCurentPosition {
    return (self.position + 1) % ALPositionCount;
}

- (CGRect)frameViewForPosition:(ALViewPosition)position {
    CGSize rootViewSize = self.bounds.size;
    CGRect frame = self.squareView.frame;
    CGPoint origin = CGPointZero;
    
    switch (position) {
        case ALTopRightPosition:
            origin.x = rootViewSize.width - frame.size.width;
            break;
            
        case ALBottomRightPosition:
            origin.x = rootViewSize.width - frame.size.width;
            origin.y = rootViewSize.height - frame.size.height;
            break;
            
        case ALBottomLeftPosition:
            origin.y = rootViewSize.height - frame.size.height;
            break;
            
        default:
            break;
    }
    
    frame.origin = origin;
    
    return frame;
}

@end
