//
//  ALUserDetailsViewController.h
//  UITask5
//
//  Created by Alexander Lisovets on 10/6/14.
//  Copyright (c) 2014 Alexander Lisovets. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ALImageView.h"
#import "ALUserDetailView.h"
#import "ALAbstractViewController.h"
#import "ALUserDetailContext.h"
#import "ALUserModel.h"
#import "ALModelObserver.h"

@interface ALUserDetailViewController : ALAbstractViewController
@property (nonatomic, readonly) ALUserDetailView    *rootView;
@property (nonatomic, strong)   ALUserModel         *model;
@property (nonatomic, strong)   ALContext           *context;

@end
