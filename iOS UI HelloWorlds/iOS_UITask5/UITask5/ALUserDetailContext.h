//
//  ALObtainUserDetailContext.h
//  UITask5
//
//  Created by Alexander Lisovets on 10/2/14.
//  Copyright (c) 2014 Alexander Lisovets. All rights reserved.
//

#import "ALLoadModelContext.h"
#import "ALUserModel.h"

@interface ALUserDetailContext : ALLoadModelContext
@property (nonatomic, strong) ALUserModel *model;

@end
