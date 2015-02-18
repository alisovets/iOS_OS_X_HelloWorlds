//
//  ALUserDetailsViewController.m
//  UITask5
//
//  Created by Alexander Lisovets on 10/6/14.
//  Copyright (c) 2014 Alexander Lisovets. All rights reserved.
//

#import "ALUserImagesViewController.h"
#import "UIViewController+ALExtension.h"
#import "ALPhotoModel.h"
#import "ALUserDetailViewController.h"

static NSString * const ALNavigationItemTitle = @"Details";

@implementation ALUserDetailViewController

#pragma mark -
#pragma mark Initializations and Deallocations

- (void)dealloc {
    self.model = nil;
    self.context = nil;
}

#pragma mark -
#pragma mark View Lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self.rootView fillWithModel:self.model];
    self.navigationItem.title = ALNavigationItemTitle;
}

#pragma mark -
#pragma mark Public

- (IBAction)onShowImagesClick:(id)sender {
    ALUserImagesViewController *viewController = [ALUserImagesViewController viewController];
    viewController.model = self.model;
    [self.navigationController pushViewController:viewController animated:YES];
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
