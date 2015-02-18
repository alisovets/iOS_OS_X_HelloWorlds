//
//  ALAppDelegate.m
//  UITask5
//
//  Created by Alexander Lisovets on 9/29/14.
//  Copyright (c) 2014 Alexander Lisovets. All rights reserved.
//

#import "ALLoginViewController.h"
#import "IDPActiveRecordKit.h"
#import "UIWindow+ALExtension.h"
#import "UIViewController+ALExtension.h"
#import "ALAppDelegate.h"

static NSString * const ALDataMomName  = @"UITask6";

@implementation ALAppDelegate

- (BOOL)              application:(UIApplication *)application
    didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    [IDPCoreDataManager sharedManagerWithMomName:ALDataMomName];

    UIWindow *window = [UIWindow window];
    self.window = window;
    window.rootViewController = [[UINavigationController alloc]
                                 initWithRootViewController:[ALLoginViewController viewController]];
    [window makeKeyAndVisible];
    
    return YES;
}

- (BOOL)application:(UIApplication *)application
            openURL:(NSURL *)url
  sourceApplication:(NSString *)sourceApplication
         annotation:(id)annotation
{
    return [FBSession.activeSession handleOpenURL:url];
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    [FBAppCall handleDidBecomeActive];
}

@end
