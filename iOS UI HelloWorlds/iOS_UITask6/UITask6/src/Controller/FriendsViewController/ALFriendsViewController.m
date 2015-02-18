//
//  ALTableViewController.m
//  UITask2
//
//  Created by Alexander Lisovets on 9/5/14.
//  Copyright (c) 2014 Alexander Lisovets. All rights reserved.
//

#import "ALUserDetailViewController.h"
#import "ALMainCell.h"
#import "NSString+ALExtension.h"
#import "UITableView+ALExtension.h"
#import "SVPullToRefresh.h"
#import "ALFriendsViewController.h"

static NSString * const ALItemTitle = @"Friends";

@implementation ALFriendsViewController

#pragma mark -
#pragma mark View Lifecycle

- (void)viewDidLoad {
    self.navigationItem.title = ALItemTitle;

    [super viewDidLoad];
}

#pragma mark -
#pragma mark Accessors

- (Class)contextClass {
    return [ALFriendsContext class];
}

- (Class)cellClass {
    return [ALMainCell class];
}

- (ALManagedArrayModel *)arrayModel {
    return self.model.friendsModel;
}

#pragma mark -
#pragma mark TableView Delegate Methods

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    ALUserDetailViewController *viewController = [ALUserDetailViewController viewController];
    viewController.model = self.model.friendsModel[indexPath.row];
    [self.navigationController pushViewController:viewController animated:YES];
}

@end
