//
//  ALAppDelegate.m
//  UITask2
//
//  Created by Alexander Lisovets on 9/5/14.
//  Copyright (c) 2014 Alexander Lisovets. All rights reserved.
//

#import "ALAppDelegate.h"
#import "ALTableViewController.h"

static const NSInteger ALDefaultModelCount = 18;

@implementation ALAppDelegate

- (BOOL)              application:(UIApplication *)application
    didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    UIWindow *window = [UIWindow window];
    self.window = window;

    ALTableViewController *viewController = [ALTableViewController viewController];
    window.rootViewController = viewController;
    
    viewController.arrayModel = [ALArrayModel arrayModelWithCount:ALDefaultModelCount];
    
    [window makeKeyAndVisible];
    
    return YES;
}

@end
