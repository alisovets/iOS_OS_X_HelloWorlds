//
//  ALViewController.h
//  UITask5
//
//  Created by Alexander Lisovets on 10/10/14.
//  Copyright (c) 2014 Alexander Lisovets. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ALAbstractModel.h"
#import "ALLoadModelContext.h"
#import "ALAbstractRootView.h"

@interface ALViewController : UIViewController<ALModelObserver>
@property (nonatomic, strong)   ALAbstractModel     *model;
@property (nonatomic, strong)   ALLoadModelContext  *context;
@property (nonatomic, readonly) ALAbstractRootView  *rootView;

@property (nonatomic, readonly) Class   contextClass;
@property (nonatomic, readonly) Class   rootViewClass;

- (void)loadModel;

@end
