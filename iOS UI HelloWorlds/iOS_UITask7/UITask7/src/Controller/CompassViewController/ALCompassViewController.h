//
//  ALCompassViewController.h
//  UITask7
//
//  Created by Alexander Lisovets on 11/4/14.
//  Copyright (c) 2014 Example. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ALCompassRootView.h"
#import "ALLocationViewController.h"
#import "ALLocationModel.h"
#import "ALLocationObserverProtocol.h"

@interface ALCompassViewController : ALAbstractViewController <ALLocationObserverProtocol>
@property (nonatomic, readonly) ALCompassRootView   *rootView;

- (IBAction)onRotate:(ALRotationGestureRecognizer *)gesture;

@end
