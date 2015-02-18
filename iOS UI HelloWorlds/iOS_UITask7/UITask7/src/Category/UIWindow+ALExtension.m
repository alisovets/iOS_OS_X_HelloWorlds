//
//  UIWindow+ALExtension.m
//  UITask2
//
//  Created by Alexander Lisovets on 9/9/14.
//  Copyright (c) 2014 Alexander Lisovets. All rights reserved.
//

#import "UIWindow+ALExtension.h"

@implementation UIWindow (ALExtension)

+ (instancetype)window {
    return [[self alloc] initWithFullScreenBounds];
}

- (instancetype)initWithFullScreenBounds {
    self = [self initWithFrame:[[UIScreen mainScreen] bounds]];
    self.backgroundColor = [UIColor whiteColor];
    
    return self;
}

@end



