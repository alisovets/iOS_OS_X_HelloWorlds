//
//  ALLocationViewController.h
//  UITask7
//
//  Created by Alexander Lisovets on 11/12/14.
//  Copyright (c) 2014 Example. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ALAbstractViewController.h"
#import "ALLocationObserverProtocol.h"
#import "ALLocationView.h"

@interface ALLocationViewController : ALAbstractViewController
@property (nonatomic, readonly) ALLocationView  *rootView;

- (IBAction)onButtonTouch:(id)sender;

@end
