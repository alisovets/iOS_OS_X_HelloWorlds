//
//  UILabel+ALExtension.m
//  UITask7
//
//  Created by Alexander Lisovets on 11/17/14.
//  Copyright (c) 2014 Example. All rights reserved.
//

#import "NSString+ALExtension.h"
#import "UILabel+ALExtension.h"

static NSString * const ALAppendFormat = @"\n%@";

@implementation UILabel (ALExtension)

- (void) resizeForContent {
    CGRect frame  = self.frame;
    CGSize size = [self sizeThatFits:CGSizeMake(frame.size.width, 0.0)];
    frame.size.height = size.height;
    self.frame = frame;
}

@end
