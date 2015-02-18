//
//  ALUserDetailsViewController.m
//  UITask5
//
//  Created by Alexander Lisovets on 10/6/14.
//  Copyright (c) 2014 Alexander Lisovets. All rights reserved.
//

#import "ALUserDetailViewController.h"

static NSString * const ALNavigationItemTitle = @"Details";

@implementation ALUserDetailViewController

#pragma mark -
#pragma mark View Lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    ALUserModel *model = self.model;
    [self.rootView fillWithModel:model];
    self.navigationItem.title = ALNavigationItemTitle;
}

- (void)viewWillDisappear:(BOOL)animated {
    self.model = nil;
    
    [super viewDidDisappear:animated];
}

#pragma mark -
#pragma mark Accessors

- (ALUserDetailView *)rootView {
    return (ALUserDetailView *)[super rootView];
}

- (Class)contextClass {
    return [ALUserDetailContext class];
}

- (Class)rootViewClass {
    return [ALUserDetailView class];
}

#pragma mark -
#pragma mark ALModelObserver

- (void)modelDidLoad:(ALUserModel *)model {
    [super modelDidLoad:model];
    [self.rootView fillWithModel:model];
}

@end
