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
#pragma mark Accessors

- (void)setModel:(ALModel *)model {
    if (model != _model) {
        _model = model;
        self.userImageView.imageModel = model.imageModel;
        [self fillWithModel:model];
    }
}

- (void)dealloc {
    self.model = nil;
}

#pragma mark -
#pragma mark Public

- (void)fillWithModel:(ALModel *)model {
    self.label.text = model.text;
}

- (void) prepareForReuse {
    [super prepareForReuse];
    self.model = nil;
}

@end
