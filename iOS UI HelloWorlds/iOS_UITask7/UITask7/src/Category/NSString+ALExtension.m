//
//  NSString+Category.m
//  UITask2
//
//  Created by Alexander Lisovets on 9/8/14.
//  Copyright (c) 2014 Alexander Lisovets. All rights reserved.
//

#import "NSString+ALExtension.h"

static const NSInteger ALAlphabetLength = 26;

static NSString * const ALAppendFormat = @"\n%@";

@implementation NSString (ALExtension)

+ (NSString *)randomStringWithLength:(NSUInteger)length {
    NSMutableString *string = [NSMutableString string];
    for (NSUInteger index = 0; index < length; index++) {
        [string appendFormat:@"%c", 'A' + arc4random_uniform(ALAlphabetLength)];
    }
    
    return [string copy];
}

- (NSUInteger)locationWithWidth:(CGFloat)width attributes:(NSDictionary *)attributes {
    NSUInteger length = [self length];
    
    for (NSUInteger location = 0; location < length; location++) {
        NSString *substring = [self substringToIndex:location];
        if ([substring sizeWithAttributes:attributes].width >= width){
            return location - 1;
        }
    }
    
    return length;
}

- (NSString *)formatedStringWithWidth:(CGFloat)width atributes:(NSDictionary *)attributes {
    NSMutableString *resultString = [NSMutableString string];
    NSUInteger textLength = [self length];
    NSUInteger startPosition = 0;
    NSString *currentString = @"";
    NSString *string = self;
    
    do {
        NSRange range = [string rangeOfCharacterFromSet:[NSCharacterSet whitespaceCharacterSet]
                                              options:0
                                                range:NSMakeRange(startPosition, textLength
                                                                  - startPosition)];
        NSUInteger position = range.location;
        NSString *substring;
        if (position == NSNotFound) {;
            substring = string;
            position = textLength;
        } else {
            substring = [string substringToIndex:position];
        }
        
        if ([substring sizeWithAttributes:attributes].width <= width) {
            currentString = substring;
            startPosition = position + range.length;
        } else {
            if (startPosition == 0) {
                startPosition = [substring locationWithWidth:width attributes:attributes];
                currentString = [string substringToIndex:startPosition];
            }
            
            [resultString appendFormat:ALAppendFormat, currentString];
            string = [string substringFromIndex:startPosition];
            currentString = @"";
            startPosition = 0;
            textLength = [string length];
        }
    } while (startPosition < textLength);
    
    if (startPosition > 0) {
        [resultString appendFormat:ALAppendFormat, currentString];
    }
    
   return [resultString copy];
}

@end
