//
//  ALUserImagesContext.m
//  UITask6
//
//  Created by Alexander Lisovets on 10/16/14.
//  Copyright (c) 2014 Alexander Lisovets. All rights reserved.
//

#import "IDPActiveRecordKit.h"
#import "IDPNetworkReachability.h"
#import "ALUserImagesContext.h"
#import "NSFileManager+ALExtension.h"
#import "ALPhotoModel.h"

static NSString * const ALResultKeyForData          = @"data";
static NSString * const ALResultKeyForId            = @"id";
static NSString * const ALResultKeyForURL           = @"source";
static NSString * const ALAttributeNameForPhotoId   = @"photoId";
static NSString * const ALRequestGraphPath          = @"/photos/uploaded?fields=id,source";

@interface ALUserImagesContext ()

- (void)deleteUnnecessaryPhotos:(NSArray *)photos;

@end

@implementation ALUserImagesContext
#pragma mark -
#pragma mark Accessors

- (NSString *)graphPath {
    return [self.model.userId stringByAppendingString:ALRequestGraphPath];
}

- (ALManagedArrayModel *)arrayModel {
    return self.model.photosModel;
}

#pragma mark -
#pragma mark Public

- (void)executeInBackground {
    ALUserModel *model = self.model;
    [model.photosModel replaceModels:[model.photos allObjects]];
    
    [super executeInBackground];
}

- (void)parseResult:(id)result {
    ALUserModel *model = self.model;
    NSArray *resultPhotos = [result objectForKey:ALResultKeyForData];
    NSMutableArray *photoArray = [NSMutableArray array];
    NSString *entityName = NSStringFromClass([ALPhotoModel class]);
    for (NSDictionary* photo in resultPhotos) {
        NSString *photoId = [photo objectForKey:ALResultKeyForId];
        ALPhotoModel *photoModel = [NSManagedObjectContext getObjectWithName:photoId
                                                                    forValue:ALAttributeNameForPhotoId
                                                                    ofEntity:entityName];
        if (photoModel) {
            [photoArray addObject:photoModel];
            if ([self isConsistentManagedModel:photoModel withLoadedEntity:photo] ) {
                continue;
            }
        } else {
            photoModel = [NSManagedObjectContext managedObjectWithEntity:entityName];
            photoModel.photoId = photoId;
            [photoArray addObject:photoModel];
        }
        
        photoModel.imageUrl = [NSURL URLWithString:[photo objectForKey:ALResultKeyForURL]];
        photoModel.user = model;
        [NSManagedObjectContext saveManagedObjectContext];
    }
    
    [self deleteUnnecessaryPhotos:photoArray];
    [model.photosModel finishLoading];
}

- (void)deleteUnnecessaryPhotos:(NSArray *)photos {
    ALUserModel *model = self.model;
    NSSet *photoSet = [model.photos copy];
    
    for (ALPhotoModel *photo in photoSet) {
        if (![photos containsObject:photo]) {
            [model removePhotoModel:photo];
        }
    }
}

- (BOOL)isConsistentManagedModel:(ALPhotoModel *)managedModel withLoadedEntity:(NSDictionary *)loadedModel {
    NSURL *url = [NSURL URLWithString:[loadedModel objectForKey:ALResultKeyForURL]];
    
    if (![managedModel.imageUrl isEqual:url]) {
        return NO;
    }
    
    if (![managedModel.user isEqual:self.model]) {
        return NO;
    }
    
    return YES;
}

@end
