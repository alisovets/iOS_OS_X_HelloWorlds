//
//  ALLocationModel.h
//  UITask7
//
//  Created by Alexander Lisovets on 11/10/14.
//  Copyright (c) 2014 Example. All rights reserved.
//

#import <CoreLocation/CoreLocation.h>
#import "ALLocationObserverProtocol.h"
#import "ALObservableObject.h"

@interface ALLocationModel : ALObservableObject<ALLocationObserverProtocol>
@property (nonatomic, strong) CLLocation    *location;
@property (nonatomic, strong) CLHeading     *heading;

+ (instancetype)model;

- (void)notifyLocationDidChanged;
- (void)notifyHeadingDidChanged;

@end
