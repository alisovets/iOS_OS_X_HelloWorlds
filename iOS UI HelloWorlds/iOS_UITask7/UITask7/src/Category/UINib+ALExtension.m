//
//  UINib+ALExtension.m
//  UITask2
//
//  Created by Alexander Lisovets on 9/9/14.
//  Copyright (c) 2014 Alexander Lisovets. All rights reserved.
//

#import "UINib+ALExtension.h"
#import "NSArray+ALExtension.h"

@implementation UINib (ALExtension)

+ (id)objectWithClass:(Class)aClass {
    return [self objectWithClass:aClass owner:nil];
}

+ (id)objectWithClass:(Class)aClass owner:(id)owner {
    return [self objectWithClass:aClass nibName:NSStringFromClass(aClass) owner:owner];
}

+ (id)objectWithClass:(Class)aClass nibName:(NSString *)nibName owner:(id)owner {
    UINib *nib = [self nibWithNibName:nibName bundle:nil];
    
    return [nib objectWithClass:aClass owner:owner];
}

- (id)objectWithClass:(Class)aClass {
    return [self objectWithClass:aClass owner:nil options:nil];
}

- (id)objectWithClass:(Class)aClass owner:(id)owner {
    return [self objectWithClass:aClass owner:owner options:nil];
}

- (id)objectWithClass:(Class)aClass owner:(id)owner options:(NSDictionary *)options {
    NSArray *array = [self instantiateWithOwner:owner options:options];
    
    return [array objectWithClass:aClass];
}

@end
