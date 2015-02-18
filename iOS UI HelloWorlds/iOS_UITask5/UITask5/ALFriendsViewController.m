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
#import "ALFriendsViewController.h"

static NSString * const ALItemTitle = @"Friends";

@implementation ALFriendsViewController

#pragma mark -
#pragma mark View Lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = ALItemTitle;
}

#pragma mark -
#pragma mark Accessors

- (ALFriendsView *)rootView {
    return (ALFriendsView *)[super rootView];
}

- (Class)contextClass {
    return [ALFriendsContext class];
}

- (Class)rootViewClass {
    return [ALFriendsView class];
}

#pragma mark -
#pragma mark TableView Delegate Methods

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.model count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath
{    
    ALMainCell *cell = [tableView dequeueReusableCellWithClass:[ALMainCell class]];
    cell.model = self.model[indexPath.row];

    return cell;
}

- (void)     tableView:(UITableView *)tableView
    moveRowAtIndexPath:(NSIndexPath *)fromIndexPath
           toIndexPath:(NSIndexPath *)toIndexPath
{
    [self.model moveFromIndex:fromIndexPath.row toIndex:toIndexPath.row];
}

- (NSIndexPath *)                  tableView:(UITableView *)tableView
    targetIndexPathForMoveFromRowAtIndexPath:(NSIndexPath *)sourceIndexPath
                         toProposedIndexPath:(NSIndexPath *)proposedDestinationIndexPath
{
    return proposedDestinationIndexPath;
}

- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    return indexPath.row < [self.model count];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    ALUserDetailViewController *viewController = [ALUserDetailViewController viewController];
    viewController.model = self.model[indexPath.row];
    [self.navigationController pushViewController:viewController animated:YES];
}

#pragma mark -
#pragma mark ALArrayModelObserver

- (void)arrayModel:(ALArrayModel *)arrayModel didAddRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableView *tableView = self.rootView.tableView;
    
    [tableView beginUpdates];
    [tableView insertRowsAtIndexPaths:@[indexPath]
                     withRowAnimation:UITableViewRowAnimationLeft];
    [tableView endUpdates];
}

- (void)arrayModel:(ALArrayModel *)arrayModel didDeleteRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableView *tableView = self.rootView.tableView;
    
    [tableView beginUpdates];
    [tableView deleteRowsAtIndexPaths:@[indexPath]
                     withRowAnimation:UITableViewRowAnimationFade];
    [tableView endUpdates];
}

- (void)modelDidLoad:(ALArrayModel *)model {
    [self.model save];
    [self.rootView.tableView reloadData];
    
    [super modelDidLoad:model];
}

@end
