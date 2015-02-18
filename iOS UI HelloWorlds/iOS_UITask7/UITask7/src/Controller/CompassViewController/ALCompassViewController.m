//
//  ALCompassViewController.m
//  UITask7
//
//  Created by Alexander Lisovets on 11/4/14.
//  Copyright (c) 2014 Example. All rights reserved.
//

#import "ALCompassViewController.h"
#import "ALLocationManager.h"

static const CLLocationDegrees  ALRadiansInDegree           = 0.01745329251994;
static const NSTimeInterval     ALAnimationStoppingDuration = 0.05;
static const NSTimeInterval     ALRotationTacktDuration     = 0.1;
static const NSTimeInterval     ALMagneticRotationDuration  = 0.05;
static const CGFloat            ALMinorAngle                = 0.001;

static NSString * const ALTabBarItemTitle  = @"Compass";

@interface ALCompassViewController ()
@property (nonatomic, strong)   ALLocationModel     *locationModel;
@property (nonatomic, assign)   BOOL                touched;

@end

@implementation ALCompassViewController

#pragma mark -
#pragma mark Accessors

- (NSString *)tabBarItemTitle {
    return ALTabBarItemTitle;
}

-(Class)rootViewClass {
    return [ALCompassRootView class];
}

#pragma mark -
#pragma mark ALLocationObserverProtocol

- (void)headingDidChangeInModel:(ALLocationModel *)model {
    ALCompassRootView *rootView = self.rootView;
    if (model == self.locationModel) {
        if (!rootView.compassEnableControl.selectedSegmentIndex) {
            [rootView.compassView animatedRotationToAngle:model.heading.magneticHeading *
                                                            ALRadiansInDegree
                                             withDuration:ALMagneticRotationDuration];
        }
    }
}

- (IBAction)onRotate:(ALRotationGestureRecognizer *)gesture {
    ALCompassView *compassView = self.rootView.compassView;
    if (gesture.state == UIGestureRecognizerStateBegan) {
        self.touched = YES;
        [compassView animatedRotationByAngle:ALMinorAngle withDuration:ALAnimationStoppingDuration];
    } else if( gesture.state == UIGestureRecognizerStateChanged) {
        self.touched = YES;
        CGFloat angle = gesture.rotation;
        [compassView animatedRotationByAngle:angle withDuration:ALRotationTacktDuration];
    } else if (gesture.state == UIGestureRecognizerStateCancelled
               || gesture.state == UIGestureRecognizerStateEnded)
    {
        self.touched = NO;
        [compassView animatedRotationToUnlimitAngle:self.locationModel.heading.magneticHeading *
            ALRadiansInDegree];
    }
}

@end
