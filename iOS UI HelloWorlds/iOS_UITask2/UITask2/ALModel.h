//
//  ALImageLabel.h
//  UITask2
//
//  Created by Alexander Lisovets on 9/8/14.
//  Copyright (c) 2014 Alexander Lisovets. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ALModel : NSObject
@property (nonatomic, readonly) NSString *imageName;
@property (nonatomic, readonly) NSString *text;

+ (instancetype)model;

- (instancetype)initWithImageName:(NSString *)imageName text:(NSString *)text;

@end
