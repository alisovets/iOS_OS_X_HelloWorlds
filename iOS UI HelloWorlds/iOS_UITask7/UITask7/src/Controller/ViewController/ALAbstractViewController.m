//
//  ALViewController.m
//  UITask7
//
//  Created by Alexander Lisovets on 11/13/14.
//  Copyright (c) 2014 Example. All rights reserved.
//

#import "ALAbstractViewController.h"
#import "ALLocationManager.h"

@implementation ALAbstractViewController

@dynamic tabBarItemTitle;
@dynamic rootViewClass;

#pragma mark -
#pragma mark Initializations and Deallocations

- (void)dealloc {
    self.locationModel = nil;
}

#pragma mark -
#pragma mark Initializations and Deallocations

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.tabBarItem.title = self.tabBarItemTitle;
    }
    
    return self;
}

#pragma mark -
#pragma mark Accessors

- (void)setLocationModel:(ALLocationModel *)locationModel {
    if (locationModel == _locationModel) {
        return;
    }
    
    [_locationModel unregisterObserver:self];
    
    _locationModel = locationModel;
    [locationModel registerObserver:self];
    [locationModel notifyLocationDidChanged];
}

- (UIView *)rootView {
    UIView *view = self.view;
    if ([self isViewLoaded] && [view isKindOfClass:[self rootViewClass]]) {
        return view;
    }
    
    return nil;
}

@end
