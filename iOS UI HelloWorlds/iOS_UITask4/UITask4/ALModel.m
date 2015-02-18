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

#define ALURLArray @[@"http://www.anotherwineblog.com/wp-content/uploads/2010/08/rubberduck.jpg", \
                     @"http://t0.gstatic.com/images?q=tbn:ANd9GcSDQFuwTFVjnbr65Hw85U8ky7TryQCTmdOy"\
                        "ROH6GApPPZwF84NggA", \
                     @"http://www.game-group.com/wp-content/uploads/2011/08/1000-derby-duck-lr1-30"\
                        "0x300.jpg", \
                     @"http://icons.iconarchive.com/icons/gianni-polito/colobrush/96/software-duck"\
                        "-icon.png", \
                     @"http://www.decadentduckevents.com/1web-decadentducks-com/img/duck_homescree"\
                        "n.jpg", \
                     @"http://t1.gstatic.com/images?q=tbn:ANd9GcTwp0FSFnmg1S_QQx1gH5daeEfxLySeWs1q"\
                        "IG7uyb-iOtLUmVLU", \
                     @"http://www.drawingcoach.com/image-files/cartoon_ducks_st5.jpg", \
                     @"http://media.hamptonroads.com/cache/files/images/1414991.jpg", \
                     @"http://www.anotherwineblog.com/nonexisted.jpg"]

static NSString * const ALCoderKeyForText       = @"text";
static NSString * const ALCoderKeyForImageModel = @"imageModel";

static const NSInteger ALDefaultTextLength  = 16;

@interface ALModel ()
@property (nonatomic, strong) ALImageModel *imageModel;
@property (nonatomic, strong) NSString  *text;

@end

@implementation ALModel

#pragma mark -
#pragma mark Class Methods

+ (instancetype)model {
    NSArray * urls = ALURLArray;
    NSURL *url = [NSURL URLWithString:urls[arc4random_uniform([urls count])]];
    
    return [[ALModel alloc] initWithUrl:url
                                   text:[NSString randomStringWithLength:ALDefaultTextLength]];
}

#pragma mark -
#pragma mark Initializations and Deallocations

- (instancetype)initWithUrl:(NSURL *)imageUrl text:(NSString *)text {
    self = [super init];
    if (self) {
        self.text = text;
        self.imageModel = [[ALImageModel alloc] initWithURL:imageUrl];
    }
    
    return self;
}

- (void)dealloc {
    self.imageModel = nil;
    self.text = nil;
}

#pragma mark -
#pragma mark NSCoding Protocol Methods

- (instancetype)initWithCoder:(NSCoder *)decoder {
    self = [super init];
    if (self) {
        self.text = [decoder decodeObjectForKey:ALCoderKeyForText];
        self.imageModel = [decoder decodeObjectForKey:ALCoderKeyForImageModel];
    }
    
    return self;
}

- (void)encodeWithCoder:(NSCoder *)encoder {
    [encoder encodeObject:self.text forKey:ALCoderKeyForText];
    [encoder encodeObject:self.imageModel forKey:ALCoderKeyForImageModel];
}

@end
