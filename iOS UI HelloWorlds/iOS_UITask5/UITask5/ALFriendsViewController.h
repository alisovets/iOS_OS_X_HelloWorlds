//
//  ALTableViewController.h
//  UITask2
//
//  Created by Alexander Lisovets on 9/5/14.
//  Copyright (c) 2014 Alexander Lisovets. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ALViewController.h"
#import "ALWaitingView.h"
#import "ALArrayModelObserver.h"
#import "ALFriendsView.h"
#import "ALFriendsContext.h"
#import "ALArrayModel.h"
#import "UIViewController+ALExtension.h"

@interface ALFriendsViewController : ALViewController<UITableViewDataSource,
                                                    UITableViewDelegate,
                                                    ALArrayModelObserver>
@property (nonatomic, readonly) ALFriendsView       *rootView;
@property (nonatomic, strong)   ALArrayModel        *model;
@property (nonatomic, strong)   ALFriendsContext    *context;

@end
