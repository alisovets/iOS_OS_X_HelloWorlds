//
//  ALAnnotationArrayModel.m
//  UITask7
//
//  Created by Alexander Lisovets on 11/14/14.
//  Copyright (c) 2014 Example. All rights reserved.
//

#import "ALAnnotationArrayModel.h"

#define ALDistanceArray @[@100.0, @500.0, @1000.0, @1000.0]
#define ALDirectionArray @[@30.0, @120.0, @240.0, @160.0];

static NSString * const ALTitleFormat       = @"distance: %.0fm.";
static NSString * const ALSubtitleFormat    = @"direction: %.0f";

@implementation ALAnnotationArrayModel

#pragma mark -
#pragma mark Class Methods

+ (instancetype)arrayModelWithLocationModel:(ALLocationModel *)locationModel {
    NSArray *distanceArray = ALDistanceArray;
    NSArray *directionArray = ALDirectionArray;
    
    ALAnnotationArrayModel *arrayModel = [self new];
    for (NSInteger index = 0; index < [distanceArray count]; index++) {
        CLLocationDirection direction = [directionArray[index] doubleValue];
        CLLocationDistance distance = [distanceArray[index] doubleValue];
        NSString *title = [NSString stringWithFormat:ALTitleFormat, distance];
        NSString *subtitle = [NSString stringWithFormat:ALSubtitleFormat, direction];
        
        ALAnnotationModel *annotation = [ALAnnotationModel anotationWithLocationModel:locationModel
                                                                                title:title
                                                                             subtitle:subtitle
                                                                            direction:direction
                                                                             distance:distance];
        
        [arrayModel addModel:annotation];
    }
    
    return arrayModel;
}

@end
