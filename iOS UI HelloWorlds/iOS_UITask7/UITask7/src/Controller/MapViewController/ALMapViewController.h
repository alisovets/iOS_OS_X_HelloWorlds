//
//  ALMapViewController.h
//  UITask7
//
//  Created by Admin on 10/26/14.
//  Copyright (c) 2014 Example. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ALMapView.h"
#import "ALAbstractViewController.h"
#import "ALAnnotationArrayModel.h"
#import "ALLocationObserverProtocol.h"
#import "ALArrayModelObserverProtocol.h"

@interface ALMapViewController : ALAbstractViewController <ALLocationObserverProtocol,
                                                   ALArrayModelObserverProtocol>
@property (nonatomic, readonly) ALMapView                 *rootView;
@property (nonatomic, strong)   ALAnnotationArrayModel    *annotations;

@end
