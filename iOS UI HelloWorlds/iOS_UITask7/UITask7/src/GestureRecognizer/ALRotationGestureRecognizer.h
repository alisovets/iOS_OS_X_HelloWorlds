//
//  ALRotationGestureRecognizer.h
//  UITask7
//
//  Created by Alexander Lisovets on 11/7/14.
//  Copyright (c) 2014 Example. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ALRotationGestureRecognizer : UIGestureRecognizer
@property (nonatomic, readonly) CGFloat rotation;

+ (instancetype)gestureRecognizerWithTarget:(id)target action:(SEL)action;

@end
