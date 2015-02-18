//
//  ALAnimationViewController.h
//  UITask1
//
//  Created by Alexander Lisovets on 9/4/14.
//  Copyright (c) 2014 Alexander Lisovets. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ALAnimationView.h"


@interface ALAnimationViewController : UIViewController
@property (nonatomic, readonly) ALAnimationView *rootView;

- (IBAction)animate:(id)sender;

@end
