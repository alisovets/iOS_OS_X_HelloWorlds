//
//  ALoginContext.m
//  UITask5
//
//  Created by Alexander Lisovets on 10/1/14.
//  Copyright (c) 2014 Alexander Lisovets. All rights reserved.
//

#import <FacebookSDK/FacebookSDK.h>
#import "ALLoginContext.h"

static NSString * const ALPermissionPublic  = @"public_profile";
static NSString * const ALPermissionEmail   = @"email";
static NSString * const ALPermissionFriends = @"user_friends";

@interface ALLoginContext ()
@property (nonatomic, strong) id<ALLoginDelegate> viewController;

@end

@implementation ALLoginContext

#pragma mark -
#pragma mark Class Methods

+ (instancetype)contextWithViewController:(id<ALLoginDelegate>)viewController {
    return [[self alloc] initWithViewController:viewController];
}

#pragma mark -
#pragma mark Initializations and Deallocations

- (instancetype)initWithViewController:(id<ALLoginDelegate>)viewController {
    self = [super init];
    if (self) {
        self.viewController = viewController;
    }
    
    return self;
}

#pragma mark -
#pragma mark Public

- (void)executeInBackground {
    __weak typeof(self) weakSelf = self;
    [FBSession openActiveSessionWithReadPermissions:@[ALPermissionPublic,
                                                      ALPermissionEmail,
                                                      ALPermissionFriends]
                                       allowLoginUI:YES
                                  completionHandler:^(FBSession *session,
                                                      FBSessionState state,
                                                      NSError *error)
        {
            dispatch_async(dispatch_get_main_queue(), ^{
                __strong typeof (self) strongSelf = weakSelf;
                if (state != FBSessionStateClosed) {
                    BOOL success = state != FBSessionStateClosedLoginFailed && !error;
                    [strongSelf.viewController context:self didFinishWithSuccess:success];
                }
            });
        }];
}

@end
