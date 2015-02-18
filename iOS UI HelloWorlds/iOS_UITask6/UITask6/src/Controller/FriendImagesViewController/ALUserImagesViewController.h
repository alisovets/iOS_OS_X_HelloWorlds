//
//  ALFriendImagesViewController.h
//  UITask6
//
//  Created by Alexander Lisovets on 10/16/14.
//  Copyright (c) 2014 Alexander Lisovets. All rights reserved.
//

#import "ALTableViewController.h"
#import "ALWaitingView.h"
#import "ALArrayModelObserver.h"
#import "ALRootTableView.h"
#import "ALManagedArrayModel.h"
#import "ALUserModel.h"
#import "ALUserImagesContext.h"
#import "ALAbstractViewController.h"

@interface ALUserImagesViewController : ALTableViewController
@property (nonatomic, readonly) ALRootTableView     *rootView;
@property (nonatomic, strong)   ALUserModel         *model;
@property (nonatomic, strong)   ALContext           *context;

@end
