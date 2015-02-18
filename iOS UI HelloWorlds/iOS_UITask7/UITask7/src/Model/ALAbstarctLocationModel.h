//
//  ALAbstarctLocationModel.h
//  UITask7
//
//  Created by Alexander Lisovets on 11/14/14.
//  Copyright (c) 2014 Example. All rights reserved.
//

#import <CoreLocation/CoreLocation.h>
#import "ALObservableObject.h"

@interface ALAbstarctLocationModel : ALObservableObject
@property (nonatomic, strong) CLLocation    *location;
@property (nonatomic, strong) CLHeading     *heading;

- (void)notifyLocationDidChanged;
- (void)notifyHeadingDidChanged;

@end
