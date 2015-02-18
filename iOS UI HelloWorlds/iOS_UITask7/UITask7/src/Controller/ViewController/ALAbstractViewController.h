//
//  ALViewController.h
//  UITask7
//
//  Created by Alexander Lisovets on 11/13/14.
//  Copyright (c) 2014 Example. All rights reserved.
//

#import "ALLocationModel.h"
#import "ALAbstractRootView.h"
#import <UIKit/UIKit.h>

@interface ALAbstractViewController : UIViewController
@property (nonatomic, strong)   ALLocationModel     *locationModel;
@property (nonatomic, readonly) NSString            *tabBarItemTitle;
@property (nonatomic, readonly) ALAbstractRootView  *rootView;

@property (nonatomic, readonly) Class   rootViewClass;

@end
