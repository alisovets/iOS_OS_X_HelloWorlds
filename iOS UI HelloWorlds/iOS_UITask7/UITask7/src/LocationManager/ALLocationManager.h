//
//  ALLocationManager.h
//  UITask7
//
//  Created by Alexander Lisovets on 11/10/14.
//  Copyright (c) 2014 Example. All rights reserved.
//

#import <CoreLocation/CoreLocation.h>
#import <Foundation/Foundation.h>
#import "ALAbstarctLocationModel.h"
#import "ALLocationModel.h"

@interface ALLocationManager : ALAbstarctLocationModel<CLLocationManagerDelegate>

+ (id)sharedManager;

@end
