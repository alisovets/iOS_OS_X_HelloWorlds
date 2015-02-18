//
//  ALImageLabel.h
//  UITask2
//
//  Created by Alexander Lisovets on 9/8/14.
//  Copyright (c) 2014 Alexander Lisovets. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ALAbstractModel.h"

@interface ALModel : ALAbstractModel<NSCoding>
@property (nonatomic, readonly) NSString    *imageName;
@property (nonatomic, readonly) NSString    *text;
@property (nonatomic, readonly) UIImage     *image;

+ (instancetype)model;

- (instancetype)initWithImageName:(NSString *)imageName text:(NSString *)text;

@end
