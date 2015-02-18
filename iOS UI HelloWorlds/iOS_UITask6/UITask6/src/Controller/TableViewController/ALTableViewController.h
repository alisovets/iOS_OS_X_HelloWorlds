//
//  ALTableViewController.h
//  UITask6
//
//  Created by Alexander Lisovets on 10/27/14.
//  Copyright (c) 2014 Alexander Lisovets. All rights reserved.
//

#import "ALArrayModelObserver.h"
#import "ALRootTableView.h"
#import "ALUserModel.h"
#import "ALManagedArrayModel.h"
#import "ALAbstractViewController.h"

@interface ALTableViewController : ALAbstractViewController <UITableViewDataSource,
                                                     UITableViewDelegate,
                                                     ALArrayModelObserver>
@property (nonatomic, readonly) ALRootTableView     *rootView;
@property (nonatomic, strong)   ALUserModel         *model;
@property (nonatomic, readonly) ALManagedArrayModel *arrayModel;

@property (nonatomic, readonly) Class   cellClass;

@end
