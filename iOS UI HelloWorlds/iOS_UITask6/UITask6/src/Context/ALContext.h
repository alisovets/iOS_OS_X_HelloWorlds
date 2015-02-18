//
//  ALContext.h
//  UITask5
//
//  Created by Alexander Lisovets on 10/1/14.
//  Copyright (c) 2014 Alexander Lisovets. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <FacebookSDK/FacebookSDK.h>
#import "ALObservableModel.h"

@interface ALContext : NSObject
@property (nonatomic, strong)   id<ALObservableModel>   model;
@property (nonatomic, strong)   FBRequestConnection     *requestConnection;
@property (nonatomic, readonly) NSString                *graphPath;

- (void)execute;
- (void)cancel;

- (void)executeInBackground;

- (void)obtainModel;
- (void)notifyAboutFail;
- (void)parseResult:(id)result;

@end
