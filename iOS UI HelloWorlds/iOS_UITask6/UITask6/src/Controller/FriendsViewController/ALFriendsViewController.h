//
//  ALTableViewController.h
//  UITask2
//
//  Created by Alexander Lisovets on 9/5/14.
//  Copyright (c) 2014 Alexander Lisovets. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ALAbstractViewController.h"
#import "ALWaitingView.h"
#import "ALTableViewController.h"
#import "ALFriendsContext.h"
#import "UIViewController+ALExtension.h"

@interface ALFriendsViewController : ALTableViewController
@property (nonatomic, strong)   ALContext    *context;

@end
