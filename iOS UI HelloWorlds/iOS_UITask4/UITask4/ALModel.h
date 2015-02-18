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

@interface ALModel : ALAbstractModel<NSCoding>
@property (nonatomic, readonly) ALImageModel *imageModel;
@property (nonatomic, readonly) NSString    *text;

+ (instancetype)model;

- (instancetype)initWithUrl:(NSURL *)imageUrl text:(NSString *)text;

@end
