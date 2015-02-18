//
//  ALMapView.m
//  UITask7
//
//  Created by Alexander Lisovets on 11/11/14.
//  Copyright (c) 2014 Example. All rights reserved.
//

#import "ALMapView.h"

static const CLLocationDistance ALMapDistance = 2500.0;

@implementation ALMapView

#pragma mark -
#pragma mark View Lifecycle

- (void)willMoveToSuperview:(UIView *)newSuperview{
    MKMapView *mapView = self.mapView;
    CLLocationCoordinate2D coordinate = mapView.userLocation.location.coordinate;
    MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance(coordinate,
                                                                   ALMapDistance,
                                                                   ALMapDistance);
    mapView.showsUserLocation = YES;
    [mapView setRegion:region animated:YES];

    [super willMoveToSuperview:newSuperview];
}

@end
