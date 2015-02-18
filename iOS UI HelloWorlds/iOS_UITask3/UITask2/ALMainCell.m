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
        [_model unregisterObserver:self];
        _model = model;
        [_model registerObserver:self];
        
        [model load];
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
    self.userImageView.image = model.image;
}

- (void) prepareForReuse {
    [super prepareForReuse];
    
    self.model = nil;
}

#pragma mark -
#pragma mark ALModelObserver

- (void)modelWillLoad:(ALModel *)model {
    [self.indicatorView startAnimating];
}

- (void)modelDidLoad:(ALModel *)model {
    [self fillWithModel:model];
    [self.indicatorView stopAnimating];
}

- (void)modelDidFail:(ALModel *)model {
    [self.indicatorView stopAnimating];
}

@end
