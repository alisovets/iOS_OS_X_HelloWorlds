//
//  ALLocationModel.m
//  UITask7
//
//  Created by Alexander Lisovets on 11/10/14.
//  Copyright (c) 2014 Example. All rights reserved.
//

#import "ALLocationModel.h"
#import "ALLocationObserverProtocol.h"
#import "ALLocationManager.h"

@implementation ALLocationModel

#pragma mark -
#pragma mark Class Methods

+ (instancetype)model {
    ALLocationModel *locationModel = [self new];
    
    return locationModel;
}

#pragma mark -
#pragma mark Initializations and Deallocations

- (void)dealloc {
    [[ALLocationManager sharedManager] unregisterObserver:self];
}

- (instancetype)init {
    self = [super init];
    if (self) {
        [[ALLocationManager sharedManager] registerObserver:self];
    }
    
    return self;
}

#pragma mark -
#pragma mark Accessors

- (void)setLocation:(CLLocation *)location {
    _location = location;
    
    [self notifyLocationDidChanged];
}

- (void)setHeading:(CLHeading *)heading {
    _heading = heading;
    
    [self notifyHeadingDidChanged];
}


#pragma mark -
#pragma mark ALLocationObserverProtocol

- (void)locationDidChangeInModel:(ALLocationManager *)model {
    self.location = model.location;
}

- (void)headingDidChangeInModel:(ALLocationManager *)model {
    self.heading = model.heading;
}



- (void)notifyLocationDidChanged; {
    [self notifyObserversInMainThreadWithSelector:@selector(locationDidChangeInModel:)
                                       withObject:self];
}

- (void)notifyHeadingDidChanged {
    [self notifyObserversInMainThreadWithSelector:@selector(headingDidChangeInModel:)
                                       withObject:self];
}


@end


