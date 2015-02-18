//
//  ALLocationManager.m
//  UITask7
//
//  Created by Alexander Lisovets on 11/10/14.
//  Copyright (c) 2014 Example. All rights reserved.
//

#import "ALLocationObserverProtocol.h"
#import "ALLocationManager.h"

@interface ALLocationManager ()
@property (nonatomic, strong) CLLocationManager *manager;

@end

@implementation ALLocationManager

#pragma mark -
#pragma mark Class Methods

+ (id)sharedManager {
    static ALLocationManager *sharedManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedManager = [ALLocationManager new];
        sharedManager.manager = [CLLocationManager new];
    });
    
    return sharedManager;
}

#pragma mark -
#pragma mark Accessors

- (void)setManager:(CLLocationManager *)manager {
    if (manager == _manager) {
        return;
    }
    
    [_manager stopUpdatingLocation];
    [_manager stopUpdatingHeading];
    
    _manager = manager;
    _manager.delegate = self;
    [_manager startUpdatingLocation];
    [_manager startUpdatingHeading];
}

#pragma mark -
#pragma mark CLLocationManagerDelegate

- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations {
    if ([locations count]) {
        CLLocation *location = [locations firstObject];
        self.location = location;
    }
}

- (void)locationManager:(CLLocationManager *)manager didUpdateHeading:(CLHeading *)newHeading {
    self.heading = newHeading;
}

@end
