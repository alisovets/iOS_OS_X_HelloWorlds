//
//  ALObtainUserDetailContext.m
//  UITask5
//
//  Created by Alexander Lisovets on 10/2/14.
//  Copyright (c) 2014 Alexander Lisovets. All rights reserved.
//

#import <FacebookSDK/FacebookSDK.h>
#import "IDPNetworkReachability.h"
#import "NSURL+ALExtesion.h"
#import "ALUserDetailContext.h"

static NSString * const ALResultKeyForName      = @"name";
static NSString * const ALResultKeyForLocation  = @"location";
static NSString * const ALGraphPathFormat       = @"/%@/photos/uploaded?fields=id,source";

@implementation ALUserDetailContext

#pragma mark -
#pragma mark Accessors

- (NSString *)graphPath {
    return self.model.userId;
}

#pragma mark -
#pragma mark Public

- (void)execute {
    ALUserModel *model = self.model;
    ALModelState state = model.state;
    [model load];
    
    if (!(ALModelLoading == state || ALModelLoaded == state)) {
        [super execute];
    }
}

- (void)executeInBackground {
    IDPNetworkReachability *reachability = [IDPNetworkReachability reachability];
    if (reachability.reachable) {
         __weak typeof(self) weakSelf = self;
        dispatch_async(dispatch_get_main_queue(), ^{
            __strong typeof (self) strongSelf = weakSelf;
            [strongSelf obtainModel];
        });
    } else {
        [self.model finishLoading];
    }
}

#pragma mark -
#pragma mark Private

- (void)parseResult:(id)result {
    ALUserModel *model = self.model;
    model.name = [result objectForKey:ALResultKeyForName];
    model.location = [[result objectForKey:ALResultKeyForLocation] objectForKey:ALResultKeyForName];
    [model finishLoading];
}

- (void)notifyAboutFail {
    [self.model failLoading];
}

@end
