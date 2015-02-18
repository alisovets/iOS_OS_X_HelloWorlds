//
//  ALUserDetailView.h
//  UITask5
//
//  Created by Alexander Lisovets on 10/10/14.
//  Copyright (c) 2014 Alexander Lisovets. All rights reserved.
//

#import "ALAbstractRootView.h"
#import "ALImageView.h"
#import "ALUserModel.h"

@interface ALUserDetailView : ALAbstractRootView
@property (nonatomic, strong)   IBOutlet ALImageView    *userImageView;
@property (nonatomic, strong)   IBOutlet UILabel        *nameLabel;
@property (nonatomic, strong)   IBOutlet UILabel        *locationLabel;

- (void)fillWithModel:(ALUserModel *)mode;

@end
