//
//  ALRootView.h
//  UITask2
//
//  Created by Alexander Lisovets on 9/5/14.
//  Copyright (c) 2014 Alexander Lisovets. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ALRootView : UIView
@property (nonatomic, strong) IBOutlet UITableView  *tableView;
@property (nonatomic, strong) IBOutlet UIButton     *editTableButton;

@property (nonatomic, readonly) BOOL waitingViewVisible;

- (void)showWaitingView;
- (void)hideWaitingView;

@end
