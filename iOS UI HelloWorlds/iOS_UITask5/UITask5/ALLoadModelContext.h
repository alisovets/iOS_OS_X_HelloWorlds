//
//  ALLoadModelContext.h
//  UITask5
//
//  Created by Alexander Lisovets on 10/8/14.
//  Copyright (c) 2014 Alexander Lisovets. All rights reserved.
//

#import <FacebookSDK/FacebookSDK.h>
#import "ALContext.h"
#import "ALAbstractModel.h"

@interface ALLoadModelContext : ALContext
@property (nonatomic, strong) ALAbstractModel       *model;
@property (nonatomic, strong) FBRequestConnection   *requestConnection;

+ (instancetype)contextWithModel:(ALAbstractModel *)model;

- (instancetype)initWithModel:(ALAbstractModel *)model;

@end
