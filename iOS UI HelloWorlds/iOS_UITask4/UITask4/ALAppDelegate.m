//
//  ALAppDelegate.m
//  UITask2
//
//  Created by Alexander Lisovets on 9/5/14.
//  Copyright (c) 2014 Alexander Lisovets. All rights reserved.
//

#import "ALAppDelegate.h"
#import "ALTableViewController.h"
#import "ALImageModel.h"

@interface ALAppDelegate ()
@property (nonatomic, strong) ALTableViewController *viewController;

@end

@implementation ALAppDelegate

- (BOOL)              application:(UIApplication *)application
    didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    UIWindow *window = [UIWindow window];
    self.window = window;

    ALTableViewController *viewController = [ALTableViewController viewController];
    window.rootViewController = viewController;
    self.viewController = viewController;
    
    viewController.arrayModel = [[ALArrayModel alloc] init];

    [window makeKeyAndVisible];
    
    return YES;
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    [self.viewController.arrayModel save];
}

- (void)applicationWillTerminate:(UIApplication *)application {
    [self.viewController.arrayModel save];
}

@end
