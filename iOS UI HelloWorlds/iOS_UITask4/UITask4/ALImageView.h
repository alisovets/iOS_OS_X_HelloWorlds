//
//  ALImageView.h
//  UITask4
//
//  Created by Alexander Lisovets on 9/23/14.
//  Copyright (c) 2014 Alexander Lisovets. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ALModelObserver.h"
#import "ALImageModel.h"

@interface ALImageView : UIView<ALModelObserver>
@property (nonatomic, strong) IBOutlet UIActivityIndicatorView  *indicatorView;
@property (nonatomic, strong) IBOutlet UIImageView              *imageView;

@property (nonatomic, strong)   ALImageModel    *imageModel;

- (void)fillWithModel:(ALImageModel *)model;

@end
