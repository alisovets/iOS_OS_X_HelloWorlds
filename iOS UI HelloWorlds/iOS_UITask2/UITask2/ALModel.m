//
//  ALImageLabel.m
//  UITask2
//
//  Created by Alexander Lisovets on 9/8/14.
//  Copyright (c) 2014 Alexander Lisovets. All rights reserved.
//

#import "ALModel.h"
#import "NSString+ALExtension.h"

static NSString * const ALDefaultImageName = @"terribleMonster.jpg";

static const NSInteger ALDefaultTextLength= 16;

@interface ALModel ()
@property (nonatomic, strong) NSString *imageName;
@property (nonatomic, strong) NSString *text;

@end

@implementation ALModel

#pragma mark -
#pragma mark Class Methods

+ (instancetype)model {
    return [[ALModel alloc] initWithImageName:ALDefaultImageName
                                         text:[NSString randomStringWithLength:ALDefaultTextLength]];
}

#pragma mark -
#pragma mark Public

- (instancetype)initWithImageName:(NSString *)imageName text:(NSString *)text {
    self = [super init];
    if (self) {
        self.text = text;
        self.imageName = imageName;
    }
    
    return self;
}

@end
