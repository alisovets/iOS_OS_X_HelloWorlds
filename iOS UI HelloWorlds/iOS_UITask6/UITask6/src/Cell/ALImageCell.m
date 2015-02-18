//
//  ALImageCell.m
//  UITask6
//
//  Created by Alexander Lisovets on 10/16/14.
//  Copyright (c) 2014 Alexander Lisovets. All rights reserved.
//

#import "ALImageCell.h"

@implementation ALImageCell

@synthesize model = _model;

#pragma mark -
#pragma mark Accessors

- (void)setModel:(ALPhotoModel *)model {
    if (model != _model) {
        _model = model;
        self.userImageView.imageModel = model.imageModel;
    }
}

#pragma mark -
#pragma mark Public

- (void) prepareForReuse {
    [super prepareForReuse];
    self.model = nil;
}

@end
