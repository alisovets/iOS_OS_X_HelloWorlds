//
//  ALLocationViewController.m
//  UITask7
//
//  Created by Alexander Lisovets on 11/12/14.
//  Copyright (c) 2014 Example. All rights reserved.
//

#import <CoreLocation/CoreLocation.h>
#import "ALLocationManager.h"
#import "ALLocationViewController.h"

static NSString * const ALTabBarItemTitle  = @"Location";

@interface ALLocationViewController ()
@property (nonatomic, strong) CLGeocoder  *geocoder;

@end

@implementation ALLocationViewController

#pragma mark -
#pragma mark Accessors

- (NSString *)tabBarItemTitle {
    return ALTabBarItemTitle;
}

- (Class)rootViewClass {
    return [ALLocationView class];
}

#pragma mark -
#pragma mark Public

- (IBAction)onButtonTouch:(id)sender {
    ALLocationView *rootView = self.rootView;
    [rootView showWaitingView];
    
    CLGeocoder *geocoder = [CLGeocoder new];
    CLLocation *location = self.locationModel.location;
    [geocoder reverseGeocodeLocation:location
                   completionHandler:^(NSArray* placemarks, NSError* error) {
                       if ([placemarks count] > 0) {
                           CLPlacemark *placemark = [placemarks firstObject];
                           [self.rootView showPlacemark:placemark location:location];
                       }
                       
                       [rootView hideWaitingView];
                   }];
}

@end
