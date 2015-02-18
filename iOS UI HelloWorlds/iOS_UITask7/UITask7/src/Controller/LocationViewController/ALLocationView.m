//
//  ALLocationView.m
//  UITask7
//
//  Created by Alexander Lisovets on 11/12/14.
//  Copyright (c) 2014 Example. All rights reserved.
//

#import <CoreLocation/CoreLocation.h>
#import "UILabel+ALExtension.h"
#import "CLPlacemark+ALExtension.h"
#import "ALLocationView.h"

@implementation ALLocationView

- (void)showPlacemark:(CLPlacemark *)placemark location:(CLLocation *)location {
    CLLocationCoordinate2D coordinate = location.coordinate;
    self.latitudeLabel.text = [NSString stringWithFormat:@"%f", coordinate.latitude];
    self.longitudeLabel.text = [NSString stringWithFormat:@"%f", coordinate.longitude];
    
    UILabel *addressLabel = self.addressLabel;
    addressLabel.text = [placemark string];
    [addressLabel resizeForContent];
}

@end
