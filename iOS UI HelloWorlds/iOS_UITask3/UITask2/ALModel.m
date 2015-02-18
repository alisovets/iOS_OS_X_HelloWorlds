//
//  ALImageLabel.m
//  UITask2
//
//  Created by Alexander Lisovets on 9/8/14.
//  Copyright (c) 2014 Alexander Lisovets. All rights reserved.
//

#import "ALModel.h"
#import "NSString+ALExtension.h"
#import "ALModelObserver.h"

static NSString * const ALDefaultImageName      = @"terribleMonster.jpg";
static NSString * const ALCoderKeyForText       = @"text";
static NSString * const ALCoderKeyForImageName  = @"imageName";

static const NSInteger ALDefaultTextLength  = 16;
static const NSInteger ALDelayRange         = 5;
static const NSInteger ALMinDelay           = 2;

@interface ALModel ()
@property (nonatomic, strong) NSString  *imageName;
@property (nonatomic, strong) NSString  *text;
@property (nonatomic, strong) UIImage   *image;

@end

@implementation ALModel

#pragma mark -
#pragma mark Class Methods

+ (instancetype)model {
    return [[ALModel alloc] initWithImageName:ALDefaultImageName
                                         text:[NSString randomStringWithLength:ALDefaultTextLength]];
}

#pragma mark -
#pragma mark Initializations and Deallocations

- (instancetype)initWithImageName:(NSString *)imageName text:(NSString *)text {
    self = [super init];
    if (self) {
        self.text = text;
        self.imageName = imageName;
    }
    
    return self;
}

#pragma mark -
#pragma mark Public

- (void)performUnloading {
    self.image = nil;
    [self finishUnloading];
}

- (void)performLoading {
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        sleep(arc4random_uniform(ALDelayRange) + ALMinDelay);
        self.image = [UIImage imageNamed:self.imageName];
        [self finishLoading];
    });
}

#pragma mark -
#pragma mark NSCoding Protocol Methods

- (instancetype)initWithCoder:(NSCoder *)decoder {
    self = [super init];
    if (self) {
        self.text = [decoder decodeObjectForKey:ALCoderKeyForText];
        self.imageName = [decoder decodeObjectForKey:ALCoderKeyForImageName];
    }
    
    return self;
}

- (void)encodeWithCoder:(NSCoder *)encoder {
    [encoder encodeObject:self.text forKey:ALCoderKeyForText];
    [encoder encodeObject:self.imageName forKey:ALCoderKeyForImageName];
}

@end
