//
//  ALViewController.h
//  UITask5
//
//  Created by Alexander Lisovets on 10/10/14.
//  Copyright (c) 2014 Alexander Lisovets. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ALModelObserver.h"
#import "ALLoadModelContext.h"
#import "ALAbstractRootView.h"
#import "ALObservableModel.h"

@interface ALAbstractViewController : UIViewController<ALModelObserver>
@property (nonatomic, strong)   id<ALObservableModel>   model;
@property (nonatomic, strong)   ALContext               *context;
@property (nonatomic, readonly) ALAbstractRootView      *rootView;

@property (nonatomic, readonly) Class   contextClass;
@property (nonatomic, readonly) Class   rootViewClass;

- (void)loadModel;

@end
