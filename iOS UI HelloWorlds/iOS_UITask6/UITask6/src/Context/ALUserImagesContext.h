//
//  ALUserImagesContext.h
//  UITask6
//
//  Created by Alexander Lisovets on 10/16/14.
//  Copyright (c) 2014 Alexander Lisovets. All rights reserved.
//

#import "ALArrayModelLoadContext.h"
#import "ALUserModel.h"

@interface ALUserImagesContext : ALArrayModelLoadContext
@property (nonatomic, strong) ALUserModel *model;

@end
