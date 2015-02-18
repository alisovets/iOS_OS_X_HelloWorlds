//
//  ALTableViewController.m
//  UITask2
//
//  Created by Alexander Lisovets on 9/5/14.
//  Copyright (c) 2014 Alexander Lisovets. All rights reserved.
//

#import "ALTableViewController.h"
#import "NSString+ALExtension.h"
#import "UITableView+ALExtension.h"
#import "ALMainCell.h"
#import "ALAddCell.h"

@implementation ALTableViewController

#pragma mark -
#pragma mark Accessors

- (ALRootView *)rootView {
    UIView *view = self.view;
    if ([self isViewLoaded] && [view isKindOfClass:[ALRootView class]]) {
        return (ALRootView *)view;
    }
    
    return nil;
}

- (void)setArrayModel:(ALArrayModel *)arrayModel {
    if (arrayModel == _arrayModel) {
        return;
    }
    
    [_arrayModel unregisterObserver:self];
    
    _arrayModel = arrayModel;
    [_arrayModel registerObserver:self];
    
    [arrayModel load];
}

- (void)setEditing:(BOOL)editing {
    super.editing = editing;
    self.rootView.tableView.editing = editing;
 }

#pragma mark -
#pragma mark Public

- (IBAction)onEditTable:(id)sender {
    BOOL editing = !self.editing;
    self.editing = editing;
    
    NSArray *lastIndexPath = @[[NSIndexPath indexPathForRow:[self.arrayModel count] inSection:0]];
    if (editing) {
        [self.rootView.tableView insertRowsAtIndexPaths:lastIndexPath
                         withRowAnimation:UITableViewRowAnimationAutomatic];
    } else {
        [self.rootView.tableView deleteRowsAtIndexPaths:lastIndexPath
                         withRowAnimation:UITableViewRowAnimationNone];
    }
}

#pragma mark -
#pragma mark TableView Delegate Methods

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.arrayModel count] + (self.editing ? 1 : 0);
}

- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSInteger rowIndex = indexPath.row;
    ALArrayModel *arrayModel = self.arrayModel;
    
    if ([arrayModel count] == rowIndex) {
        return [tableView dequeueReusableCellWithClass:[ALAddCell class]];
    }
    
    ALMainCell *cell = [tableView dequeueReusableCellWithClass:[ALMainCell class]];
    cell.model = self.arrayModel[indexPath.row];

    return cell;
}

- (void)     tableView:(UITableView *)tableView
    moveRowAtIndexPath:(NSIndexPath *)fromIndexPath
           toIndexPath:(NSIndexPath *)toIndexPath
{
    [self.arrayModel moveFromIndex:fromIndexPath.row toIndex:toIndexPath.row];
}

- (void)     tableView:(UITableView *)tableView
    commitEditingStyle:(UITableViewCellEditingStyle)editingStyle
     forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [self.arrayModel removeModelAtIndex:indexPath.row];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        [self.arrayModel addModel:[ALModel model]];
    }
}

- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView
           editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row < [self.arrayModel count]) {
        return UITableViewCellEditingStyleDelete;
    } else {
        return UITableViewCellEditingStyleInsert;
    }
}

- (NSIndexPath *)                  tableView:(UITableView *)tableView
    targetIndexPathForMoveFromRowAtIndexPath:(NSIndexPath *)sourceIndexPath
                         toProposedIndexPath:(NSIndexPath *)proposedDestinationIndexPath
{
    if (proposedDestinationIndexPath.row == [self.arrayModel count]) {
        return sourceIndexPath;
    }
    
    return proposedDestinationIndexPath;
}

- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    return indexPath.row < [self.arrayModel count];
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

- (void)modelDidLoad:(ALArrayModel *)arrayModel {
    ALRootView *rootView = self.rootView;
    [rootView.tableView reloadData];
    [rootView hideWaitingView];
}

- (void)modelWillLoad:(ALArrayModel *)model {
    [self.rootView showWaitingView];
}

- (void)modelDidFail:(ALArrayModel *)model {
    [self.rootView hideWaitingView];
}

@end
