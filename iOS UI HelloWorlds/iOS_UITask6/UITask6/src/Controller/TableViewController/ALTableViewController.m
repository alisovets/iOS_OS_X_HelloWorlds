//
//  ALTableViewController.m
//  UITask6
//
//  Created by Alexander Lisovets on 10/27/14.
//  Copyright (c) 2014 Alexander Lisovets. All rights reserved.
//

#import "ALCell.h"
#import "NSString+ALExtension.h"
#import "UITableView+ALExtension.h"
#import "SVPullToRefresh.h"
#import "ALTableViewController.h"

@interface ALTableViewController ()
- (void)reloadModel;

@end

@implementation ALTableViewController

@dynamic cellClass;

@synthesize model = _model;

#pragma mark -
#pragma mark View Lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    __weak typeof(self) weakSelf = self;
    [weakSelf.rootView.tableView addPullToRefreshWithActionHandler:^{
        __strong typeof (self) strongSelf = weakSelf;
        UITableView *tableView = strongSelf.rootView.tableView;
        
        [self reloadModel];
        [tableView.pullToRefreshView stopAnimating];
    }];
}

- (void)viewDidAppear:(BOOL)animated {
    [self.rootView.tableView triggerPullToRefresh];
}

#pragma mark -
#pragma mark Accessors

- (ALRootTableView *)rootView {
    return  (ALRootTableView *)[super rootView];
}

- (Class)rootViewClass {
    return [ALRootTableView class];
}

- (ALManagedArrayModel *)arrayModel {
    return nil;
}

- (void)setModel:(ALUserModel *)model {
    if (model != _model) {
        [self.arrayModel unregisterObserver:self];
        _model = model;
        [self.arrayModel registerObserver:self];
    }
}

#pragma mark -
#pragma mark Public

- (void)reloadModel {
    ALManagedArrayModel *arrayModel = self.arrayModel;
    if (arrayModel.state != ALModelLoading) {
        [arrayModel refreshState];
        [self loadModel];
    }
}

#pragma mark -
#pragma mark TableView Delegate Methods

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.arrayModel count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    ALCell *cell = [tableView dequeueReusableCellWithClass:self.cellClass];
    cell.model = self.arrayModel[indexPath.row];
    
    return cell;
}

- (void)     tableView:(UITableView *)tableView
    moveRowAtIndexPath:(NSIndexPath *)fromIndexPath
           toIndexPath:(NSIndexPath *)toIndexPath
{
    [self.arrayModel moveFromIndex:fromIndexPath.row toIndex:toIndexPath.row];
}

- (NSIndexPath *)                  tableView:(UITableView *)tableView
    targetIndexPathForMoveFromRowAtIndexPath:(NSIndexPath *)sourceIndexPath
                         toProposedIndexPath:(NSIndexPath *)proposedDestinationIndexPath
{
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
    [tableView insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationLeft];
    [tableView endUpdates];
}

- (void)arrayModel:(ALArrayModel *)arrayModel didDeleteRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableView *tableView = self.rootView.tableView;
    [tableView beginUpdates];
    [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    [tableView endUpdates];
}

- (void)modelDidLoad:(ALArrayModel *)model {
    [self.rootView.tableView reloadData];
    
    [super modelDidLoad:model];
}

@end
