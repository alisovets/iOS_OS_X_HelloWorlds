//
//  ALPhotoModel.h
//  UITask6
//
//  Created by Alexander Lisovets on 10/20/14.
//  Copyright (c) 2014 Alexander Lisovets. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>
#import "ALImageModel.h"
#import "ALManagedModel.h"

@class ALUserModel;

@interface ALPhotoModel : ALManagedModel

@property (nonatomic, strong)   NSString        *photoId;
@property (nonatomic, strong)   id              imageUrl;
@property (nonatomic, strong)   ALUserModel     *user;
@property (nonatomic, readonly) ALImageModel    *imageModel;

+ (instancetype)modelWithURL:(NSURL *)imageURL;

- (instancetype) initWithURL:(NSURL *)imageURL;

@end
