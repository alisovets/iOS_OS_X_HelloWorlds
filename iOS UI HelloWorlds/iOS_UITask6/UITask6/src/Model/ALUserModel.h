//
//  ALUserModel.h
//  UITask6
//
//  Created by Alexander Lisovets on 10/20/14.
//  Copyright (c) 2014 Alexander Lisovets. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>
#import "ALPhotoModel.h"
#import "ALManagedArrayModel.h"
#import "ALImageModel.h"

@class ALUserModel;

@interface ALUserModel : ALManagedModel
@property (nonatomic, strong)   NSString            *userId;
@property (nonatomic, strong)   NSString            *name;
@property (nonatomic, strong)   NSString            *firstName;
@property (nonatomic, strong)   NSString            *lastName;
@property (nonatomic, strong)   NSString            *location;
@property (nonatomic, strong)   NSSet               *friends;
@property (nonatomic, strong)   NSSet               *photos;

@property (nonatomic, readonly)   ALManagedArrayModel *friendsModel;
@property (nonatomic, readonly)   ALManagedArrayModel *photosModel;

@property (nonatomic, readonly) NSURL               *smallImageURL;
@property (nonatomic, readonly) NSURL               *largeImageURL;
@property (nonatomic, readonly) ALImageModel        *smallImageModel;
@property (nonatomic, readonly) ALImageModel        *largeImageModel;

+ (instancetype)modelWithId:(NSString *)userId;

- (void)addFriendModel:(ALUserModel *)friendModel;
- (void)removeFriendModel:(ALUserModel *)friendModel;

- (void)addPhotoModel:(ALPhotoModel *)photoModel;
- (void)removePhotoModel:(ALPhotoModel *)photoModel;

@end
