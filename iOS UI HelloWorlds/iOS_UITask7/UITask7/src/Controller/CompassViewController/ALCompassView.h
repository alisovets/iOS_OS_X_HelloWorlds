//
//  ALCompassView.h
//  UITask7
//
//  Created by Alexander Lisovets on 11/4/14.
//  Copyright (c) 2014 Example. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ALRotationGestureRecognizer.h"

@interface ALCompassView : UIView
@property (nonatomic, strong) IBOutlet UILabel  *northLabel;
@property (nonatomic, strong) IBOutlet UILabel  *southLabel;
@property (nonatomic, strong) IBOutlet UILabel  *westLabel;
@property (nonatomic, strong) IBOutlet UILabel  *eastLabel;

@property (nonatomic, assign) CGFloat   angle;

- (void)animatedRotationToAngle:(CGFloat)angle withDuration:(NSTimeInterval)duration;
- (void)animatedRotationByAngle:(CGFloat)angle withDuration:(NSTimeInterval)duration;
- (void)animatedRotationToUnlimitAngle:(CGFloat)angle;

@end
