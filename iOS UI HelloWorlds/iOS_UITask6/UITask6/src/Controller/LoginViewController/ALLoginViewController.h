//
//  ALLoginViewController.h
//  UITask5
//
//  Created by Admin on 10/3/14.
//  Copyright (c) 2014 Alexander Lisovets. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <FacebookSDK/FacebookSDK.h>
#import "ALAbstractViewController.h"
#import "ALLoginDelegate.h"

@class ALLoginView;

@interface ALLoginViewController : UIViewController<ALLoginDelegate>
@property (nonatomic, readonly) ALLoginView   *rootView;

@end