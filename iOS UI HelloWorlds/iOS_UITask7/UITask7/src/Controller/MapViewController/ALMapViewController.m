//
//  ALMapViewController.m
//  UITask7
//
//  Created by Admin on 10/26/14.
//  Copyright (c) 2014 Example. All rights reserved.
//

#import "ALArrayModel.h"
#import "ALAnnotationArrayModel.h"
#import "ALMapViewController.h"

static NSString * const ALTabBarItemTitle  = @"Map";

@interface ALMapViewController ()

- (void)resetAnnotations;

@end

@implementation ALMapViewController

#pragma mark -
#pragma mark Initializations and Deallocations

- (void)dealloc {
    self.annotations = nil;
}

#pragma mark -
#pragma mark Accessors

- (NSString *)tabBarItemTitle {
    return ALTabBarItemTitle;
}

- (Class)rootViewClass {
    return [ALMapView class];
}

- (void)setAnnotations:(ALAnnotationArrayModel *)annotations {
    if (annotations != _annotations) {
        [_annotations unregisterObserver:self];
        _annotations = annotations;
        [_annotations registerObserver:self];
        
        [self resetAnnotations];
    }
}

#pragma mark -
#pragma mark Private

- (void)resetAnnotations {
    MKMapView *mapView = self.rootView.mapView;
    [mapView removeAnnotations:[mapView annotations]];
    [mapView addAnnotations:self.annotations.array];
}

#pragma mark -
#pragma mark ALLocationObserverProtocol

- (void)locationDidChangeInModel:(ALLocationModel *)model {
    if (model == self.locationModel) {
        CLLocationCoordinate2D coordinate = model.location.coordinate;
        [self.rootView.mapView setCenterCoordinate:coordinate animated:YES];
    }
}

#pragma mark -
#pragma mark ALArrayModelObserverProtocol

- (void)arrayModel:(ALArrayModel *)arrayModel didAddRowAtIndex:(NSNumber *)index {
    if (arrayModel == self.annotations) {
        [self resetAnnotations];
    }
}

- (void)arrayModel:(ALArrayModel *)arrayModel didDeleteRowAtIndex:(NSNumber *)index {
    if (arrayModel == self.annotations) {
        [self resetAnnotations];
    }
}

@end
