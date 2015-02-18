//
//  ALRotationGestureRecognizer.m
//  UITask7
//
//  Created by Alexander Lisovets on 11/7/14.
//  Copyright (c) 2014 Example. All rights reserved.
//

#import <UIKit/UIGestureRecognizerSubclass.h>
#import "ALRotationGestureRecognizer.h"

static const CGFloat AL2PI = M_PI * 2;

@interface ALRotationGestureRecognizer ()
@property (nonatomic, assign) CGFloat rotation;

@end

@implementation ALRotationGestureRecognizer

#pragma mark -
#pragma mark Class Methods

+ (instancetype)gestureRecognizerWithTarget:(id)target action:(SEL)action {
    return [[self alloc] initWithTarget:target action:action];
}

#pragma mark -
#pragma mark Public

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    [super touchesBegan:touches withEvent:event];
    self.state = UIGestureRecognizerStateBegan;
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
    UIView *view = self.view;
    UIView *superview = view.superview;
    
    UITouch *touch = [touches anyObject];
    
    CGPoint center = view.center;
    CGPoint location = [touch locationInView:superview];
    CGPoint previousLocation = [touch previousLocationInView:superview];
    CGFloat angle = atan2((location.x - center.x), (center.y - location.y));
    CGFloat previousAngle = atan2((previousLocation.x - center.x), (center.y - previousLocation.y));
    
    CGFloat rotation = angle - previousAngle;
    rotation = (rotation > M_PI) ? AL2PI - rotation : rotation;
    rotation = (rotation < -M_PI) ? AL2PI + rotation : rotation;
    
    self.rotation = rotation;
    self.state = UIGestureRecognizerStateChanged;
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    [super touchesEnded:touches withEvent:event];
    
    self.state = UIGestureRecognizerStateEnded;
}

- (void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event {
    [super touchesCancelled:touches withEvent:event];
    
    self.state = UIGestureRecognizerStateCancelled;
}

@end
