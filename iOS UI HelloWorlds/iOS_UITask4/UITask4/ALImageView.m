//
//  ALImageView.m
//  UITask4
//
//  Created by Alexander Lisovets on 9/23/14.
//  Copyright (c) 2014 Alexander Lisovets. All rights reserved.
//

#import "ALImageView.h"
#import "NSBundle+ALExtension.h"

@implementation ALImageView

#pragma mark -
#pragma mark Accessors

- (void)setImageModel:(ALImageModel *)model {
    if (model != _imageModel) {
        [_imageModel unregisterObserver:self];
        _imageModel = model;
        [_imageModel registerObserver:self];
        
        [model load];
    }
}

#pragma mark -
#pragma mark Public

- (void)fillWithModel:(ALImageModel *)model {
    self.imageView.image = model.image;
}

#pragma mark -
#pragma mark ALModelObserver

- (void)modelWillLoad:(ALImageModel *)model {
    [self fillWithModel:model];
    [self.indicatorView startAnimating];
}

- (void)modelDidLoad:(ALImageModel *)model {
    [self fillWithModel:model];
    [self.indicatorView stopAnimating];
}

- (void)modelDidFail:(ALImageModel *)model {
    [self.indicatorView stopAnimating];
}

- (void)modelDidCancel:(ALImageModel *)model {
    [self.indicatorView stopAnimating];
}

@end
