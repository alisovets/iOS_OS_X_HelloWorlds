//
//  UITableView+ALExtension.m
//  UITask2
//
//  Created by Alexander Lisovets on 9/8/14.
//  Copyright (c) 2014 Alexander Lisovets. All rights reserved.
//

#import "UITableView+ALExtension.h"
#include "NSBundle+ALExtension.h"

@implementation UITableView (ALExtension)

- (id)dequeueReusableCellWithClass:(Class)aClass {
    NSString *identifier = NSStringFromClass(aClass);
    UITableViewCell *cell = [self dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [NSBundle objectWithClass:aClass];
    }

    return cell;
}

@end
