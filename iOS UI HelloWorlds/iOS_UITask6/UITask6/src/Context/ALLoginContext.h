//
//  ALoginContext.h
//  UITask5
//
//  Created by Alexander Lisovets on 10/1/14.
//  Copyright (c) 2014 Alexander Lisovets. All rights reserved.
//

#import "ALContext.h"
#import "ALUserModel.h"
#import "ALLoginViewController.h"

@interface ALLoginContext : ALContext
@property (nonatomic, strong) ALUserModel *model;

+ (instancetype)contextWithViewController:(id<ALLoginDelegate>)viewController;

- (instancetype)initWithViewController:(id<ALLoginDelegate>)viewController;

@end
