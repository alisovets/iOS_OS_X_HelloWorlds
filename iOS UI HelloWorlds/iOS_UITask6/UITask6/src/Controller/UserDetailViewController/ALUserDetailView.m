//
//  ALUserDetailView.m
//  UITask5
//
//  Created by Alexander Lisovets on 10/10/14.
//  Copyright (c) 2014 Alexander Lisovets. All rights reserved.
//

#import "ALUserDetailView.h"

@implementation ALUserDetailView

#pragma mark -
#pragma mark Public

- (void)fillWithModel:(ALUserModel *)model {
    self.nameLabel.text = model.name;
    self.locationLabel.text = model.location;
    self.userImageView.imageModel = model.largeImageModel;
}

@end
