//
//  ALPhotoModel.m
//  UITask6
//
//  Created by Alexander Lisovets on 10/20/14.
//  Copyright (c) 2014 Alexander Lisovets. All rights reserved.
//

#import "IDPActiveRecordKit.h"
#import "ALPhotoModel.h"
#import "ALUserModel.h"

static NSString * const ALCoderKeyForImageURL   = @"imageURL";
static NSString * const ALPredicateFormat       = @"user = %@";

@implementation ALPhotoModel

@dynamic photoId;
@dynamic imageUrl;
@dynamic user;

#pragma mark -
#pragma mark Class Methods

+ (instancetype)modelWithURL:(NSURL *)imageURL {
    return [[self alloc] initWithURL:imageURL];
}

+ (NSPredicate *)predicateWithModel:(ALUserModel *)model {
    return [NSPredicate predicateWithFormat:ALPredicateFormat, model];
}

#pragma mark -
#pragma mark Initializations and Deallocations

- (instancetype)initWithURL:(NSURL *)imageURL {
    if (!imageURL) {
        return nil;
    }
    
    self = [super init];
    if (self) {
        self.imageUrl = imageURL;
    }
    
    return self;
}

#pragma mark -
#pragma mark Accessors

- (ALImageModel *)imageModel {
    return [ALImageModel imageModelWithUrl:self.imageUrl];
}

@end
