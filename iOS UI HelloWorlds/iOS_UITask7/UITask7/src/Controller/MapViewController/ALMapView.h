//
//  ALMapView.h
//  UITask7
//
//  Created by Alexander Lisovets on 11/11/14.
//  Copyright (c) 2014 Example. All rights reserved.
//

#import <MapKit/MapKit.h>
#import <UIKit/UIKit.h>
#import "ALAbstractRootView.h"

@interface ALMapView : ALAbstractRootView
@property (nonatomic, strong) IBOutlet MKMapView *mapView;

@end
