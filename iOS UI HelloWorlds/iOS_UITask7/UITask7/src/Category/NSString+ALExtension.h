//
//  NSString+Category.h
//  UITask2
//
//  Created by Alexander Lisovets on 9/8/14.
//  Copyright (c) 2014 Alexander Lisovets. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (ALExtension)
+ (NSString *)randomStringWithLength:(NSUInteger)length;

- (NSUInteger)locationWithWidth:(CGFloat)width attributes:(NSDictionary *)attributes;
- (NSString *)formatedStringWithWidth:(CGFloat)width atributes:(NSDictionary *)attributes;

@end
