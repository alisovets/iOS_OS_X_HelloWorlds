//
//  ALoginContext.m
//  UITask5
//
//  Created by Alexander Lisovets on 10/1/14.
//  Copyright (c) 2014 Alexander Lisovets. All rights reserved.
//

#import <FacebookSDK/FacebookSDK.h>
#import "ALUserModel.h"
#import "NSManagedObjectContext+IDPExtensions.h"
#import "ALLoginContext.h"

static NSString * const ALPermissionPublic          = @"public_profile";
static NSString * const ALPermissionFriends         = @"user_friends";
static NSString * const ALPermissionLocation        = @"user_location";
static NSString * const ALPermissionFriendLocation  = @"friends_location";
static NSString * const ALPermissionPhotos          = @"user_photos";
static NSString * const ALUserIdGraphPath           = @"me?fields=id";
static NSString * const ALResultKeyForId            = @"id";


@interface ALLoginContext ()
@property (nonatomic, strong) id<ALLoginDelegate> viewController;

@end

@implementation ALLoginContext

#pragma mark -
#pragma mark Class Methods

+ (instancetype)contextWithViewController:(id<ALLoginDelegate>)viewController {
    return [[ALLoginContext alloc] initWithViewController:viewController];
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
#pragma mark Accessors

- (NSString *)graphPath {
    return ALUserIdGraphPath;
}

#pragma mark -
#pragma mark Public

- (void)executeInBackground {
    [FBSession openActiveSessionWithReadPermissions:@[ALPermissionPublic,
                                                      ALPermissionFriends,
                                                      ALPermissionLocation,
                                                      ALPermissionFriendLocation,
                                                      ALPermissionPhotos]
     
                                       allowLoginUI:YES
                                  completionHandler:^(FBSession *session,
                                                      FBSessionState state,
                                                      NSError *error)
        {
             __weak typeof(self) weakSelf = self;
            dispatch_async(dispatch_get_main_queue(), ^{
                __strong typeof (self) strongSelf = weakSelf;
                if (state != FBSessionStateClosed) {
                    BOOL success = state != FBSessionStateClosedLoginFailed && !error;
                    if (success) {
                        [strongSelf obtainModel];
                    } else {
                        [strongSelf notifyAboutFail];
                    }
                }
            });
        }];
}

- (void)parseResult:(id)result {
    NSString *userId = [result objectForKey:ALResultKeyForId];
    self.model = [ALUserModel modelWithId:userId];
        
    [self.viewController context:self didFinishWithSuccess:YES];
}

- (void)notifyAboutFail {
    [self.viewController context:self didFinishWithSuccess:NO];
}

@end
