//
//  ALLocationView.h
//  UITask7
//
//  Created by Alexander Lisovets on 11/12/14.
//  Copyright (c) 2014 Example. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ALAbstractRootView.h"

@interface ALLocationView : ALAbstractRootView
@property (nonatomic, strong) IBOutlet UIButton  *locationButton;
@property (nonatomic, strong) IBOutlet UILabel   *addressLabel;
@property (nonatomic, strong) IBOutlet UILabel   *latitudeLabel;
@property (nonatomic, strong) IBOutlet UILabel   *longitudeLabel;

- (void)showPlacemark:(CLPlacemark *)placemark location:(CLLocation *)location;

@end
