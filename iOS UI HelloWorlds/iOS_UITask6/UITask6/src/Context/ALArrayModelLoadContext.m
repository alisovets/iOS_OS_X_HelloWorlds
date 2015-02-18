//
//  ALArrayModelLoadContext.m
//  UITask6
//
//  Created by Alexander Lisovets on 10/31/14.
//  Copyright (c) 2014 Alexander Lisovets. All rights reserved.
//

#import "IDPNetworkReachability.h"
#import "ALArrayModelLoadContext.h"

@implementation ALArrayModelLoadContext

#pragma mark -
#pragma mark Public

- (void)execute {
    ALArrayModel *arrayModel = self.arrayModel;
    ALModelState state = arrayModel.state;
    [arrayModel load];
    
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
        [self.arrayModel finishLoading];
    }
}

- (void)notifyAboutFail {
    [self.arrayModel failLoading];
}

@end
