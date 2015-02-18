//
//  ALWaitingView.h
//  UITask3
//
//  Created by Alexander Lisovets on 9/12/14.
//  Copyright (c) 2014 Alexander Lisovets. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ALWaitingView : UIView
@property (nonatomic, strong) IBOutlet UIActivityIndicatorView *activityIndicatorView;

@property (nonatomic, readonly) BOOL visible;

+ (id)waitingViewOnSuperview:(UIView *)superview;

- (void)show;
- (void)hide;

@end
