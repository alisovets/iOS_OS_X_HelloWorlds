//
//  ALImageLabel.h
//  UITask2
//
//  Created by Alexander Lisovets on 9/8/14.
//  Copyright (c) 2014 Alexander Lisovets. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ALAbstractModel.h"
#import "ALImageModel.h"

@interface ALUserModel : ALAbstractModel<NSCoding>
@property (nonatomic, strong)   NSString        *userId;
@property (nonatomic, strong)   NSString        *name;
@property (nonatomic, strong)   NSString        *firstName;
@property (nonatomic, strong)   NSString        *lastName;
@property (nonatomic, strong)   NSString        *location;
@property (nonatomic, readonly) NSURL           *smallImageURL;
@property (nonatomic, readonly) NSURL           *largeImageURL;
@property (nonatomic, readonly) ALImageModel    *smallImageModel;
@property (nonatomic, readonly) ALImageModel    *largeImageModel;

+ (instancetype)userModelWithId:(NSString *)userId
                      firstName:(NSString *)firstName
                       lastName:(NSString *)lastName;

- (instancetype)initWithId:(NSString *)userId
                 firstName:(NSString *)firstName
                  lastName:(NSString *)lastName;

@end
