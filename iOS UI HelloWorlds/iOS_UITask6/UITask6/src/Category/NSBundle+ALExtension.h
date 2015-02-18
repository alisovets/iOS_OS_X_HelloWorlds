//
//  NSBundle+ALExtension.h
//  UITask2
//
//  Created by Alexander Lisovets on 9/9/14.
//  Copyright (c) 2014 Alexander Lisovets. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSBundle (ALExtension)
+ (id)objectWithClass:(Class)aClass;
+ (id)objectWithClass:(Class)aClass owner:(id)owner;
+ (id)objectWithClass:(Class)aClass nibName:(NSString *)nibName owner:(id)owner;

- (id)objectWithClass:(Class)aClass;
- (id)objectWithClass:(Class)aClass owner:(id)owner;
- (id)objectWithClass:(Class)aClass nibName:(NSString *)nibName owner:(id)owner;

@end
