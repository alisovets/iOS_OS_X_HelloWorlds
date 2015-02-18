//
//  NSString+Category.m
//  UITask2
//
//  Created by Alexander Lisovets on 9/8/14.
//  Copyright (c) 2014 Alexander Lisovets. All rights reserved.
//

#import "NSString+ALExtension.h"

static const NSInteger ALAlphabetLength = 26;

@implementation NSString (ALExtension)

+ (NSString *)randomStringWithLength:(NSUInteger)length {
    NSMutableString *string = [NSMutableString string];
    for (NSUInteger index = 0; index < length; index++) {
        [string appendFormat:@"%c", 'A' + arc4random_uniform(ALAlphabetLength)];
    }
    
    return [string copy];
}

@end
