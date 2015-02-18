//
//  ALPointAnotation.m
//  UITask7
//
//  Created by Alexander Lisovets on 10/29/14.
//  Copyright (c) 2014 Example. All rights reserved.
//

#import "ALObservableObject.h"
#import "ALArrayModel.h"
#import "ALAnnotationModel.h"

static const CLLocationDistance ALEquatorDegreeLength   = 111111.1;
static const CLLocationDegrees  ALDegreesInRadian       = 57.29577951308233;
static const CLLocationDegrees  ALMaxLatitude           = 90;
static const CLLocationDegrees  ALMaxLongitude          = 180;

@interface ALAnnotationModel ()
@property (nonatomic, assign)   CLLocationCoordinate2D  coordinate;
@property (nonatomic, copy)     NSString                *subtitle;
@property (nonatomic, copy)     NSString                *title;

@end

@implementation ALAnnotationModel

#pragma mark -
#pragma mark Class Methods

+ (instancetype)anotationWithLocationModel:(ALLocationModel *)locationModel
                                     title:(NSString *)title
                                  subtitle:(NSString *)subtitle
                                 direction:(CLLocationDirection)direction
                                  distance:(CLLocationDistance)distance
{
    return [[self alloc] initWithLocatioModel:locationModel
                                        title:title
                                     subtitle:subtitle
                                    direction:direction
                                     distance:distance];
}
                                              
#pragma mark -
#pragma mark Initializations and Deallocations

- (void)dealloc {
    self.locationModel = nil;
}

#pragma mark -
#pragma mark Initializations and Deallocations

- (instancetype)initWithLocatioModel:(ALLocationModel *)locationModel
                               title:(NSString *)title
                            subtitle:(NSString *)subtitle
                           direction:(CLLocationDirection)direction
                            distance:(CLLocationDistance)distance
{
    self  =[self init];
    if (self) {
        self.title = title;
        self.subtitle = subtitle;
        self.direction = direction;
        self.distance = distance;
        self.locationModel = locationModel;
    }
    
    return self;
}

#pragma mark -
#pragma mark Accessors

- (void)setLocationModel:(ALLocationModel *)model {
    if (model == _locationModel) {
        return;
    }
    
    [model unregisterObserver:self];
    _locationModel = model;
    [model registerObserver:self];
}

#pragma mark -
#pragma mark ModelObserverProtocol

- (void)locationDidChangeInModel:(ALLocationModel *)model {
    CLLocationCoordinate2D baseCoordinate = model.location.coordinate;
    CLLocationDirection direction = self.direction;
    CLLocationDistance distance = self.distance;
    CLLocationDegrees latitude = baseCoordinate.latitude;
    CLLocationDegrees longitude = baseCoordinate.longitude;
    
    double latitudeDistance = distance * cos(direction / ALDegreesInRadian);
    double longitudeDistance = distance * sin(direction / ALDegreesInRadian);
    latitude = latitude + latitudeDistance / ALEquatorDegreeLength;
    latitude = latitude > ALMaxLatitude ? ALMaxLatitude : latitude;
    latitude = latitude < -ALMaxLatitude ? -ALMaxLatitude : latitude;
    
    longitude = longitude + longitudeDistance / ALEquatorDegreeLength
        / cos(baseCoordinate.latitude / ALDegreesInRadian);
    longitude = longitude > ALMaxLongitude ? longitude - 2 * ALMaxLongitude : longitude;
    longitude = longitude < -ALMaxLongitude ? longitude + 2 * ALMaxLongitude :longitude;
    
    self.coordinate = CLLocationCoordinate2DMake(latitude, longitude);
}

@end
