//
//  UIViewController+ALExtension.m
//  UITask2
//
//  Created by Alexander Lisovets on 9/9/14.
//  Copyright (c) 2014 Alexander Lisovets. All rights reserved.
//

#import "UIViewController+ALExtension.h"

@implementation UIViewController (ALExtension)

+ (instancetype)viewController {
    return [[self alloc] initViewController];
}

- (instancetype)initViewController {
    return [self initWithNibName:NSStringFromClass([self class]) bundle:nil];
}

@end
