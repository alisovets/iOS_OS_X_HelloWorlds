//
//  ALFriendImagesViewController.m
//  UITask6
//
//  Created by Alexander Lisovets on 10/16/14.
//  Copyright (c) 2014 Alexander Lisovets. All rights reserved.
//

#import "ALImageCell.h"
#import "UIViewController+ALExtension.h"
#import "UITableView+ALExtension.h"
#import "ALUserImagesViewController.h"

static NSString * const ALItemTitle = @"Friend Photos";

@implementation ALUserImagesViewController

#pragma mark -
#pragma mark View Lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = ALItemTitle;
}

#pragma mark -
#pragma mark Accessors

- (Class)contextClass {
    return [ALUserImagesContext class];
}

- (Class)cellClass {
    return [ALImageCell class];
}

- (ALManagedArrayModel *)arrayModel {
    
    return self.model.photosModel;
}

@end
