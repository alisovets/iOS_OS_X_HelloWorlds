//
//  ALMainCell.m
//  UITask2
//
//  Created by Alexander Lisovets on 9/10/14.
//  Copyright (c) 2014 Alexander Lisovets. All rights reserved.
//

#import "ALMainCell.h"

@implementation ALMainCell

@synthesize model = _model;

#pragma mark -
#pragma mark Accessors

- (void)setModel:(ALUserModel *)model {
    if (model != _model) {
        _model = model;
        self.userImageView.imageModel = model.smallImageModel;
        [self fillWithModel:model];
    }
}

#pragma mark -
#pragma mark Public

- (void)fillWithModel:(ALUserModel *)model {
    self.label.text = [NSString stringWithFormat:@"%@ %@", model.firstName, model.lastName];
}

- (void) prepareForReuse {
    [super prepareForReuse];
    self.model = nil;
}

@end
