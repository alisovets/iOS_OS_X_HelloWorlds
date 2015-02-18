//
//  ALCell.h
//  UITask2
//
//  Created by Alexander Lisovets on 9/10/14.
//  Copyright (c) 2014 Alexander Lisovets. All rights reserved.
//

#import "ALObservableModel.h"
#import <UIKit/UIKit.h>

@interface ALCell : UITableViewCell
@property (nonatomic, strong) id<ALObservableModel> model;

@end
