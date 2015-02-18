//
//  ALTabBarController.m
//  UITask7
//
//  Created by Alexander Lisovets on 11/13/14.
//  Copyright (c) 2014 Example. All rights reserved.
//

#import "ALMapViewController.h"
#import "ALCompassViewController.h"
#import "ALLocationViewController.h"
#import "ALAnnotationArrayModel.h"
#import "UIViewController+ALExtension.h"
#import "ALTabBarController.h"

@implementation ALTabBarController

#pragma mark -
#pragma mark Initializations and Deallocations

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        ALLocationModel *locationModel = [ALLocationModel new];
        ALMapViewController *mapViewController = [ALMapViewController viewController];
        mapViewController.locationModel = locationModel;
        ALAnnotationArrayModel *annotations = [ALAnnotationArrayModel
                                               arrayModelWithLocationModel:locationModel];
        mapViewController.annotations = annotations;
        
        ALCompassViewController *compassViewController = [ALCompassViewController viewController];
        compassViewController.locationModel = locationModel;
        
        ALLocationViewController *locationViewController = [ALLocationViewController viewController];
        locationViewController.locationModel = locationModel;
        
        self.viewControllers = @[mapViewController, locationViewController, compassViewController];
    }
    
    return self;
}

@end
