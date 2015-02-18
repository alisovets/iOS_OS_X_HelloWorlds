//
//  CLPlacemark+ALExtension.m
//  UITask7
//
//  Created by Alexander Lisovets on 11/19/14.
//  Copyright (c) 2014 Example. All rights reserved.
//

#import "CLPlacemark+ALExtension.h"

static NSString * const ALAddressLinesKey = @"FormattedAddressLines";

@implementation CLPlacemark (ALExtension)

- (NSString *)string {
    NSArray *addressLines = [self.addressDictionary objectForKey:ALAddressLinesKey];
    
    NSMutableString *resultString = [NSMutableString stringWithString:self.name];
    for (NSString *addressLine in addressLines) {
        [resultString appendString:[@", " stringByAppendingString:addressLine]];
    
    }
    
    return [resultString copy];
}

@end
