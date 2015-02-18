//
//  ALPointAnotation.h
//  UITask7
//
//  Created by Alexander Lisovets on 10/29/14.
//  Copyright (c) 2014 Example. All rights reserved.
//

#import <MapKit/MapKit.h>
#import "ALLocationObserverProtocol.h"
#import "ALLocationManager.h"
#import "ALLocationModel.h"

@interface ALAnnotationModel : ALObservableObject <MKAnnotation, ALLocationObserverProtocol>
@property (nonatomic, assign) CLLocationDirection   direction;
@property (nonatomic, assign) CLLocationDistance    distance;
@property (nonatomic, assign) ALLocationModel       *locationModel;

+ (instancetype)anotationWithLocationModel:(ALLocationModel *)locationModel
                                     title:(NSString *)title
                                  subtitle:(NSString *)subtitle
                                 direction:(CLLocationDirection)direction
                                  distance:(CLLocationDistance)distance;

- (instancetype)initWithLocatioModel:(ALLocationModel *)locationModel
                               title:(NSString *)title
                            subtitle:(NSString *)subtitle
                           direction:(CLLocationDirection)direction
                            distance:(CLLocationDistance)distance;

@end
