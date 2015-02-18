//
//  ALImageLabel.m
//  UITask2
//
//  Created by Alexander Lisovets on 9/8/14.
//  Copyright (c) 2014 Alexander Lisovets. All rights reserved.
//

#import "ALUserDetailContext.h"
#import "ALModelObserver.h"
#import "NSString+ALExtension.h"
#import "NSURL+ALExtesion.h"
#import "ALUserModel.h"

static NSString * const ALCoderKeyForUserId             = @"userId";
static NSString * const ALCoderKeyForFirstName          = @"firstName";
static NSString * const ALCoderKeyForLastName           = @"lastName";

@implementation ALUserModel

@dynamic smallImageURL;
@dynamic largeImageURL;
@dynamic smallImageModel;
@dynamic largeImageModel;

#pragma mark -
#pragma mark Class Methods

+ (instancetype)userModelWithId:(NSString *)userId
                      firstName:(NSString *)firstName
                       lastName:(NSString *)lastName
{
    return [[self alloc] initWithId:userId firstName:firstName lastName:lastName];
}

#pragma mark -
#pragma mark Initializations and Deallocations

- (instancetype)initWithId:(NSString *)userId
                 firstName:(NSString *)firstName
                  lastName:(NSString *)lastName
{
    self = [super init];
    if (self) {
        self.userId = userId;
        self.firstName = firstName;
        self.lastName = lastName;
    }
    
    return self;
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

#pragma mark -
#pragma mark NSCoding Protocol Methods

- (instancetype)initWithCoder:(NSCoder *)decoder {
    NSString *userId = [decoder decodeObjectForKey:ALCoderKeyForUserId];
    NSString *firstName = [decoder decodeObjectForKey:ALCoderKeyForFirstName];
    NSString *lastName = [decoder decodeObjectForKey:ALCoderKeyForLastName];
    
    return [self initWithId:userId firstName:firstName lastName:lastName];
}

- (void)encodeWithCoder:(NSCoder *)encoder {
    [encoder encodeObject:self.userId forKey:ALCoderKeyForUserId];
    [encoder encodeObject:self.firstName forKey:ALCoderKeyForFirstName];
    [encoder encodeObject:self.lastName forKey:ALCoderKeyForLastName];
}

@end
