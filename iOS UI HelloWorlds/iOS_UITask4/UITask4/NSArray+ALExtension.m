//
//  NSArray+ALExtension.m
//  UITask2
//
//  Created by Alexander Lisovets on 9/10/14.
//  Copyright (c) 2014 Alexander Lisovets. All rights reserved.
//

#import "NSArray+ALExtension.h"

@implementation NSArray (ALExtension)

- (id)objectWithClass:(Class)aClass {
    for (id object in self) {
        if ([object isKindOfClass:aClass]){
            return object;
        }
    }
    
    return nil;
}

@end
