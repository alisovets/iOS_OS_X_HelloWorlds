//
//  ALMainCell.h
//  UITask2
//
//  Created by Alexander Lisovets on 9/10/14.
//  Copyright (c) 2014 Alexander Lisovets. All rights reserved.
//

#import "ALCell.h"
#import "ALImageView.h"
#import "ALModel.h"


@interface ALMainCell : ALCell<ALModelObserver>
@property (nonatomic, strong) IBOutlet UILabel                  *label;
@property (nonatomic, strong) IBOutlet ALImageView              *userImageView;

@property (nonatomic, strong) ALModel *model;

- (void)fillWithModel:(ALModel *)model;

@end
