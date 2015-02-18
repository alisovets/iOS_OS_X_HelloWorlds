//
//  ALCompassView.m
//  UITask7
//
//  Created by Alexander Lisovets on 11/4/14.
//  Copyright (c) 2014 Example. All rights reserved.
//

#import "ALCompassView.h"

static const CGFloat        ALCompasRadiusFactor            = 0.4;
static const CGFloat        ALArrowLengthFactor             = 0.6;
static const CGFloat        ALArrowWidthFactor              = 0.1;
static const CGFloat        ALHatchOuterRadiusFactor        = 0.95;
static const CGFloat        ALGeneralHatchInnerRadiusFactor = 0.9;
static const CGFloat        ALPrimaryHatchInnerRadiusFactor = 0.85;
static const CGFloat        ALHatchCount                    = 80;
static const CGFloat        ALHatchAngle                    = M_PI * 2 / ALHatchCount;
static const NSInteger      ALPrimaryHatchCount             = 5;
static const NSTimeInterval ALRadianRotationTime            = 0.1;
static const CGFloat        ALMaxRotationAngle              = 0.3;
static const CGFloat        ALMinRotationAngle              = 0.001;

@interface ALCompassView ()
@property (nonatomic, assign) CGPoint   compasCenter;
@property (nonatomic, assign) CGFloat   radius;
@property (nonatomic, assign) CGRect    compassRect;
@property (nonatomic, assign) BOOL      touched;
@property (atomic, assign)    BOOL      animating;

- (void)drawDisk;
- (void)drawHatches;
- (void)drawArrow;
- (void)transformLabels;

@end

@implementation ALCompassView

#pragma mark -
#pragma mark View Lifecycle

- (void)awakeFromNib {
    [super awakeFromNib];

    CGSize size = self.bounds.size;
    CGPoint center = CGPointMake(size.width / 2, size.height / 2);
    self.compasCenter = center;
    CGFloat radius = (size.width > size.height ? size.height : size.width) * ALCompasRadiusFactor;
    CGRect rect = CGRectMake(center.x - radius, center.y - radius, radius * 2, radius * 2);
    self.radius = radius;
    self.compassRect = rect;
    
}

#pragma mark -
#pragma mark View Lifecycle

- (void)drawRect:(CGRect)rect {
    [self drawDisk];
    [self drawHatches];
    [self drawArrow];
    [self transformLabels];
}

#pragma mark -
#pragma mark Private

- (void)drawDisk {
    CGContextRef graphicsContext = UIGraphicsGetCurrentContext();
    CGContextSaveGState(graphicsContext);
    CGContextSetFillColorWithColor(graphicsContext, [UIColor cyanColor].CGColor);
    CGContextSetShadowWithColor(graphicsContext, CGSizeMake(0, 0), 10.0,[UIColor blackColor].CGColor);
    CGContextFillEllipseInRect(graphicsContext, self.compassRect);
    CGContextRestoreGState(graphicsContext);
}

- (void)drawHatches {
    CGPoint center = self.compasCenter;
    CGFloat radius = self.radius;
    CGFloat outerRadius = radius * ALHatchOuterRadiusFactor;
    CGFloat primaryInnerRadius = radius * ALPrimaryHatchInnerRadiusFactor;
    CGFloat generalInnerRadius = radius * ALGeneralHatchInnerRadiusFactor;
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSaveGState(context);
    CGContextSetLineWidth(context, 1.0);
   
	for (NSInteger index = 0; index < ALHatchCount; index++) {
        CGFloat angle = index * ALHatchAngle;
        CGFloat cosAngle = cos(angle);
        CGFloat sinAngle = sin(angle);
        
        CGContextMoveToPoint(context,
                             center.x + outerRadius * sinAngle,
                             center.y - outerRadius * cosAngle);
        
        CGFloat innerRadius = index % ALPrimaryHatchCount ? generalInnerRadius : primaryInnerRadius;
        CGContextAddLineToPoint(context,
                                center.x + innerRadius * sinAngle,
                                center.y - innerRadius * cosAngle);
    }
    
    CGContextStrokePath(context);
    CGContextRestoreGState(context);
}

- (void)drawArrow {
    CGPoint center = self.compasCenter;
    CGFloat radius = self.radius;
    CGFloat length = radius * ALArrowLengthFactor;
    CGFloat width = radius * ALArrowWidthFactor;
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSaveGState(context);
    
    for (NSInteger index = 0; index < 2; index++){
        UIColor *color = index == 0 ? [UIColor blueColor] : [UIColor redColor];
        CGFloat tipYCoordinate = index == 0 ? center.y - length : center.y + length;
        CGContextSetFillColorWithColor(context, [color CGColor]);
    
        CGContextBeginPath(context);
        CGContextMoveToPoint   (context, center.x, tipYCoordinate);
        CGContextAddLineToPoint(context, center.x - width, center.y);
        CGContextAddLineToPoint(context, center.x + width, center.y);
        CGContextAddLineToPoint(context, center.x, tipYCoordinate);
        CGContextClosePath(context);
        CGContextFillPath(context);
    }
    
    CGContextRestoreGState(context);
}

- (void)transformLabels {
    NSArray *labels = @[self.northLabel, self.eastLabel, self.southLabel, self.westLabel];
    CGAffineTransform transform = CGAffineTransformMakeRotation(0.0);
    for (UIView *label in labels) {
        label.transform = transform;
        transform = CGAffineTransformRotate(transform, M_PI_2);
    }
}

- (void)animatedRotationToUnlimitAngle:(CGFloat)angle {
    self.animating = YES;
    CGFloat nextAngle = angle;
    CGFloat currentAngle = self.angle;
    CGFloat angleDifference = nextAngle - currentAngle;
    if (fabs(angleDifference) < ALMinRotationAngle) {
        self.animating = NO;
        return;
    }
    
    if (angleDifference > ALMaxRotationAngle) {
        nextAngle = currentAngle + ALMaxRotationAngle;
    } else if (angleDifference < -ALMaxRotationAngle) {
        nextAngle = currentAngle - ALMaxRotationAngle;
    }
    
    NSTimeInterval duration = fabs(nextAngle - currentAngle) * ALRadianRotationTime;
    __weak typeof(self) weakSelf = self;
    [UIView animateWithDuration:duration
                          delay:0.0
                        options:UIViewAnimationOptionBeginFromCurrentState
                                | UIViewAnimationOptionCurveLinear
                                | UIViewAnimationOptionAllowUserInteraction
                     animations:^{
                          __strong typeof (self) strongSelf = weakSelf;
                         strongSelf.transform = CGAffineTransformMakeRotation(nextAngle);
                     }
                     completion:^(BOOL finished) {
                         __strong typeof (self) strongSelf = weakSelf;
                         if (finished) {
                             strongSelf.angle = nextAngle;
                             [strongSelf animatedRotationToUnlimitAngle:angle];
                         } else {
                             strongSelf.animating = NO;
                         }
                     }];
}

- (void)animatedRotationToAngle:(CGFloat)angle withDuration:(NSTimeInterval)duration{
    @synchronized(self) {
        if (self.animating) {
            return;
        }
    }

    __weak typeof(self) weakSelf = self;
    [UIView animateWithDuration:duration
                          delay:0.0
                        options:UIViewAnimationOptionBeginFromCurrentState
                     animations:^{
                         __strong typeof (self) strongSelf = weakSelf;
                         strongSelf.transform = CGAffineTransformMakeRotation(angle);
                     }
                     completion:^(BOOL finished) {
                         __strong typeof (self) strongSelf = weakSelf;
                         if (finished) {
                             strongSelf.angle = angle;
                         }
                     }];
}

- (void)animatedRotationByAngle:(CGFloat)angle withDuration:(NSTimeInterval)duration {
    __weak typeof(self) weakSelf = self;
    [UIView animateWithDuration:duration
                          delay:0.0
                        options:UIViewAnimationOptionBeginFromCurrentState
                               | UIViewAnimationOptionAllowUserInteraction
                     animations:^{
                         __strong typeof (self) strongSelf = weakSelf;
                         strongSelf.transform = CGAffineTransformRotate(strongSelf.transform, angle);
                       strongSelf.angle += angle;
                     }
                     completion:nil];
}

@end
