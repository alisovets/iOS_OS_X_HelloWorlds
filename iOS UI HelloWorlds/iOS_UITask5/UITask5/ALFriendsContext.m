//
//  ALObtainUserContext.m
//  UITask5
//
//  Created by Alexander Lisovets on 10/1/14.
//  Copyright (c) 2014 Alexander Lisovets. All rights reserved.
//

#import "ALNetworkReachability.h"
#import "ALUserModel.h"
#import "NSFileManager+ALExtension.h"
#import "ALFriendsContext.h"

static NSString * const ALResultKeyForData      = @"data";
static NSString * const ALResultKeyForId        = @"id";
static NSString * const ALResultKeyForFirstName = @"first_name";
static NSString * const ALResultKeyForLastName  = @"last_name";
static NSString * const ALRequestGraphPath      = @"/me/friends?fields=id,name,first_name,last_name";

@interface ALFriendsContext ()
- (void)loadFriendsFromInternet;
- (void)loadFriendsFromCache;

@end

@implementation ALFriendsContext

#pragma mark -
#pragma mark Public

- (void)executeInBackground {
    if ([ALNetworkReachability reachable]) {
         __weak typeof(self) weakSelf = self;
        dispatch_async(dispatch_get_main_queue(), ^{
            __strong typeof (self) strongSelf = weakSelf;
            [strongSelf loadFriendsFromInternet];
        });
    } else {
        [self loadFriendsFromCache];
    }
}

#pragma mark -
#pragma mark Private

- (void)loadFriendsFromInternet {
    ALArrayModel *model = self.model;
    self.requestConnection = [FBRequestConnection startWithGraphPath:ALRequestGraphPath
                                                          parameters:nil
                                                          HTTPMethod:@"GET"
                                                   completionHandler:^(FBRequestConnection *connection,
                                                                       id result,
                                                                       NSError *error)
    {
        if (error) {
            NSLog(@"error: %@", [FBErrorUtility userMessageForError:error]);
            [model failLoading];
            
            return;
        }
        
        NSArray *friends = [result objectForKey:ALResultKeyForData];
        for (NSDictionary* friend in friends) {
            NSString *friendId = [friend objectForKey:ALResultKeyForId];
            NSString *firstName = [friend objectForKey:ALResultKeyForFirstName];
            NSString *lastName = [friend objectForKey:ALResultKeyForLastName];
            ALUserModel *userModel = [ALUserModel userModelWithId:friendId
                                                        firstName:firstName
                                                         lastName:lastName];
            [model addModel:userModel];
            [userModel finishPartlyLoading];
        }
        [model save];
        [model finishLoading];
  }];
}

- (void)loadFriendsFromCache {
    ALArrayModel *model = self.model;
    ALArrayModel *cachedModel = [NSKeyedUnarchiver unarchiveObjectWithFile:
                                [NSFileManager cachePathWithFilename:ALArchiveFile]];
    if ([cachedModel isKindOfClass:[ALArrayModel class]]) {
        [model replaceModels:cachedModel.array];
        [model finishLoading];
    } else {
        [model failLoading];
    }
}

@end
