//
//  ALAbstarctLocationModel.m
//  UITask7
//
//  Created by Alexander Lisovets on 11/14/14.
//  Copyright (c) 2014 Example. All rights reserved.
//

#import "ALLocationObserverProtocol.h"
#import "ALAbstarctLocationModel.h"

@implementation ALAbstarctLocationModel

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

- (void)notifyLocationDidChanged; {
    [self notifyObserversInMainThreadWithSelector:@selector(locationDidChangeInModel:)
                                       withObject:self];
}

- (void)notifyHeadingDidChanged {
    [self notifyObserversInMainThreadWithSelector:@selector(headingDidChangeInModel:)
                                       withObject:self];
}

@end
