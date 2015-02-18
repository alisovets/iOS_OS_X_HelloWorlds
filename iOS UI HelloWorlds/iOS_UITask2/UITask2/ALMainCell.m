//
//  ALMainCell.m
//  UITask2
//
//  Created by Alexander Lisovets on 9/10/14.
//  Copyright (c) 2014 Alexander Lisovets. All rights reserved.
//

#import "ALMainCell.h"

@implementation ALMainCell

#pragma mark -
#pragma mark Public

- (void)fillWithModel:(ALModel *)model {
    self.userImageView.image = [UIImage imageNamed:model.imageName];
    self.label.text = model.text;
}

@end
