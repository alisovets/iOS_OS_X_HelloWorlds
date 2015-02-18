//
//  ALObtainUserDetailContext.m
//  UITask5
//
//  Created by Alexander Lisovets on 10/2/14.
//  Copyright (c) 2014 Alexander Lisovets. All rights reserved.
//

#import <FacebookSDK/FacebookSDK.h>
#import "ALNetworkReachability.h"
#import "NSURL+ALExtesion.h"
#import "ALUserDetailContext.h"

static NSString * const ALResultKeyForName      = @"name";
static NSString * const ALResultKeyForLocation  = @"location";

@interface ALUserDetailContext ()
- (void)loadUserDetails;

@end

@implementation ALUserDetailContext

#pragma mark -
#pragma mark Public

- (void)executeInBackground {
    if ([ALNetworkReachability reachable]) {
         __weak typeof(self) weakSelf = self;
        dispatch_async(dispatch_get_main_queue(), ^{
            __strong typeof (self) strongSelf = weakSelf;
            [strongSelf loadUserDetails];
        });
    } else {
        [self.model finishLoading];
    }
}

#pragma mark -
#pragma mark Private

- (void)loadUserDetails {
    ALUserModel *model = self.model;
    self.requestConnection = [FBRequestConnection startWithGraphPath:model.userId
                                                          parameters:nil
                                                          HTTPMethod:@"GET"
                                                   completionHandler:^(FBRequestConnection *connection,
                                                                       id result,
                                                                       NSError *error
                                                                       )
    {
        if (error) {
            NSLog(@"error: %@", [FBErrorUtility userMessageForError:error]);
            [model failLoading];
            
            return;
        }
        
        model.name = [result objectForKey:ALResultKeyForName];
        model.location = [[result objectForKey:ALResultKeyForLocation] objectForKey:ALResultKeyForName];
        [model finishLoading];
    }];
}

@end
