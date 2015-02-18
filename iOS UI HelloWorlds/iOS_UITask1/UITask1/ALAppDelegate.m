//
//  ALAppDelegate.m
//  UITask1
//
//  Created by Alexander Lisovets on 9/4/14.
//  Copyright (c) 2014 Alexander Lisovets. All rights reserved.
//

#import "ALAppDelegate.h"
#import "ALAnimationViewController.h"

@implementation ALAppDelegate

- (BOOL)          application:(UIApplication *)application
didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    UIWindow *window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window = window;
    window.backgroundColor = [UIColor whiteColor];
    window.rootViewController = [[ALAnimationViewController alloc]
        initWithNibName:@"ALAnimationViewController" bundle:nil];
    [window makeKeyAndVisible];
    
    return YES;
}

@end
