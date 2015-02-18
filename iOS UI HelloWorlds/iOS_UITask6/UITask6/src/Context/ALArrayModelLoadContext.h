//
//  ALArrayModelLoadContext.h
//  UITask6
//
//  Created by Alexander Lisovets on 10/31/14.
//  Copyright (c) 2014 Alexander Lisovets. All rights reserved.
//

#import "ALLoadModelContext.h"
#import "ALUserModel.h"

@interface ALArrayModelLoadContext : ALLoadModelContext
@property (nonatomic, strong)   ALUserModel         *model;
@property (nonatomic, readonly) ALManagedArrayModel *arrayModel;

@end
