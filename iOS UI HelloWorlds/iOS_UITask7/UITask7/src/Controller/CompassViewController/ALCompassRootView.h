//
//  ALCompasRootView.h
//  UITask7
//
//  Created by Alexander Lisovets on 11/4/14.
//  Copyright (c) 2014 Example. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ALAbstractRootView.h"
#import "ALCompassView.h"

@interface ALCompassRootView : ALAbstractRootView
@property (nonatomic, strong) IBOutlet ALCompassView                *compassView;
@property (nonatomic, strong) IBOutlet UISegmentedControl           *compassEnableControl;
@property (nonatomic, strong) IBOutlet ALRotationGestureRecognizer  *gestureRecognizer;

@end
