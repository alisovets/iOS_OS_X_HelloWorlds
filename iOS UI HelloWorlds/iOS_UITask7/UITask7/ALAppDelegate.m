//
//  ALAppDelegate.m
//  UITask7
//
//  Created by Admin on 10/26/14.
//  Copyright (c) 2014 Example. All rights reserved.
//

#import "UIWindow+ALExtension.h"
#import "UIViewController+ALExtension.h"
#import "ALTabBarController.h"
#import "ALAppDelegate.h"

@implementation ALAppDelegate

- (BOOL)              application:(UIApplication *)application
    didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    ALTabBarController *tabBarController = [ALTabBarController viewController];
 
    UIWindow *window = [UIWindow window];
    window.rootViewController = tabBarController;
    self.window = window;
    
    [window makeKeyAndVisible];
    
    return YES;
}

@end
