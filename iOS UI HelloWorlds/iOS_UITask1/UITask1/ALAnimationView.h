//
//  ALAnimationView.h
//  UITask1
//
//  Created by Alexander Lisovets on 9/4/14.
//  Copyright (c) 2014 Alexander Lisovets. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum {
    ALTopLeftPosition = 0,
    ALTopRightPosition,
    ALBottomRightPosition,
    ALBottomLeftPosition,
    ALPositionCount
} ALViewPosition;

@interface ALAnimationView : UIView
@property (nonatomic, strong) IBOutlet UIView *squareView;
@property (nonatomic, assign) BOOL           animating;

- (void)setPosition:(ALViewPosition)position animated:(BOOL)animated;
- (void)setPosition:(ALViewPosition)position
           animated:(BOOL)animated
  completionHandler:(void (^)(BOOL))completionHandler;

- (void)executeAnimation;
- (void)startAnimation;
- (void)stopAnimation;

- (void)animate;

@end
