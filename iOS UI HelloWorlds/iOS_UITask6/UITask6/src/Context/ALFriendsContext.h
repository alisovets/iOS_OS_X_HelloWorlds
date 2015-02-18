//
//  ALObtainUserContext.h
//  UITask5
//
//  Created by Alexander Lisovets on 10/1/14.
//  Copyright (c) 2014 Alexander Lisovets. All rights reserved.
//

#import "ALArrayModelLoadContext.h"
#import "ALUserModel.h"

@interface ALFriendsContext : ALArrayModelLoadContext
@property (nonatomic, strong) ALUserModel *model;

@end
