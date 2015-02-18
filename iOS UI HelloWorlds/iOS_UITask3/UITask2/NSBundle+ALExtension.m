//
//  NSBundle+ALExtension.m
//  UITask2
//
//  Created by Alexander Lisovets on 9/9/14.
//  Copyright (c) 2014 Alexander Lisovets. All rights reserved.
//

#import "NSBundle+ALExtension.h"
#import "NSArray+ALExtension.h"

@implementation NSBundle (ALExtension)

+ (id)objectWithClass:(Class)aClass {
    return [self objectWithClass:aClass owner:nil];
}

+ (id)objectWithClass:(Class)aClass owner:(id)owner {
    return [[NSBundle mainBundle] objectWithClass:aClass owner:owner];
}

+ (id)objectWithClass:(Class)aClass nibName:(NSString *)nibName owner:(id)owner {
   return [[NSBundle mainBundle] objectWithClass:aClass nibName:nibName owner:owner];
}

- (id)objectWithClass:(Class)aClass {
    return [self objectWithClass:aClass owner:nil];
}

- (id)objectWithClass:(Class)aClass owner:(id)owner {
    return [self objectWithClass:aClass nibName:NSStringFromClass(aClass) owner:owner];
}

- (id)objectWithClass:(Class)aClass nibName:(NSString *)nibName owner:(id)owner {
    NSArray *array = [self loadNibNamed:nibName owner:owner options:nil];
    
    return [array objectWithClass:aClass];
}

@end
