//
//  ALUserModel.m
//  UITask6
//
//  Created by Alexander Lisovets on 10/20/14.
//  Copyright (c) 2014 Alexander Lisovets. All rights reserved.
//

#import "IDPActiveRecordKit.h"
#import "ALUserDetailContext.h"
#import "ALModelObserver.h"
#import "NSString+ALExtension.h"
#import "NSURL+ALExtesion.h"
#import "NSManagedObject+IDPExtensions.h"
#import "ALUserModel.h"

static NSString * const ALFriendsKey                = @"friends";
static NSString * const ALPhotosKey                 = @"photos";
static NSString * const ALPredicateFormat           = @"%@ IN friends";
static NSString * const ALAttributeNameForUserId    = @"userId";

@interface ALUserModel ()
@property (nonatomic, strong) ALImageModel        *smallImageModel;
@property (nonatomic, strong) ALImageModel        *largeImageModel;

@end

@implementation ALUserModel

@dynamic userId;
@dynamic name;
@dynamic firstName;
@dynamic lastName;
@dynamic location;
@dynamic friends;
@dynamic photos;
@dynamic smallImageURL;
@dynamic largeImageURL;
@dynamic smallImageModel;
@dynamic largeImageModel;

@synthesize friendsModel = _friendsModel;
@synthesize photosModel = _photosModel;

#pragma mark -
#pragma mark Class Methods

+ (instancetype)modelWithId:(NSString *)userId {
    ALUserModel *userModel = (ALUserModel *)[NSManagedObjectContext getObjectWithName:userId
                                             forValue:ALAttributeNameForUserId
                                             ofEntity:NSStringFromClass(self)];
    if (!userModel) {
        userModel = [NSManagedObjectContext managedObjectWithEntity:NSStringFromClass(self)];
        userModel.userId = userId;
        [NSManagedObjectContext saveManagedObjectContext];
        
    }

    return userModel;
}

+ (NSPredicate *)predicateWithModel:(ALUserModel *)model {
     return [NSPredicate predicateWithFormat:ALPredicateFormat, model];
}

#pragma mark -
#pragma mark Accessors

- (NSURL *)smallImageURL {
    return [NSURL imageURLForFacebookId:self.userId isLarge:NO];
}

- (NSURL *)largeImageURL {
    return [NSURL imageURLForFacebookId:self.userId isLarge:YES];
}

- (ALImageModel *)smallImageModel {
    return [ALImageModel imageModelWithUrl:self.smallImageURL];
}

- (ALImageModel *)largeImageModel {
    return [ALImageModel imageModelWithUrl:self.largeImageURL];
}

- (ALManagedArrayModel *)friendsModel {
    if (_friendsModel) {
        return _friendsModel;
    }
    
    _friendsModel = [ALManagedArrayModel modelWithUserModel:self entityClass:[ALUserModel class]];

    return _friendsModel;
}

- (ALManagedArrayModel *)photosModel {
    if (_photosModel) {
        return _photosModel;
    }
    
    _photosModel = [ALManagedArrayModel modelWithUserModel:self entityClass:[ALPhotoModel class]];
    
    return _photosModel;
}


#pragma mark -
#pragma mark Public

- (void)addFriendModel:(ALUserModel *)friendModel {
    [self addCustomValue:friendModel inMutableSetForKey:ALFriendsKey];
}

- (void)removeFriendModel:(ALUserModel *)friendModel {
    [self removeCustomValue:friendModel inMutableSetForKey:ALFriendsKey];
}

- (void)addPhotoModel:(ALPhotoModel *)photoModel {
    [self addCustomValue:photoModel inMutableSetForKey:ALPhotosKey];
}

- (void)removePhotoModel:(ALPhotoModel *)photoModel {
    [self removeCustomValue:photoModel inMutableSetForKey:ALPhotosKey];
}

@end
