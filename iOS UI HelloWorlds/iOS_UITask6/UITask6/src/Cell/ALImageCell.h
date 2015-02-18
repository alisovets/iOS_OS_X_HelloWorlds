//
//  ALImageCell.h
//  UITask6
//
//  Created by Alexander Lisovets on 10/16/14.
//  Copyright (c) 2014 Alexander Lisovets. All rights reserved.
//

#import "ALCell.h"
#import "ALImageView.h"
#import "ALPhotoModel.h"

@interface ALImageCell : ALCell
@property (nonatomic, strong) IBOutlet ALImageView  *userImageView;

@property (nonatomic, strong) ALPhotoModel *model;

@end
