//
//  ALTableViewController.h
//  UITask2
//
//  Created by Alexander Lisovets on 9/5/14.
//  Copyright (c) 2014 Alexander Lisovets. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ALArrayModelObserver.h"
#import "ALRootView.h"
#import "ALArrayModel.h"
#import "ALWaitingView.h"
#import "UIViewController+ALExtension.h"

@interface ALTableViewController : UIViewController<UITableViewDataSource,
                                                    UITableViewDelegate,
                                                    ALArrayModelObserver>
@property (nonatomic, readonly) ALRootView      *rootView;
@property (nonatomic, strong)   ALArrayModel    *arrayModel;

- (IBAction)onEditTable:(id)sender;

@end
