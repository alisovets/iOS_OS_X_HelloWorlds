//
//  ALWasher.h
//  training task3
//
//  Created by Alexander Lisovets on 8/15/14.
//  Copyright (c) 2014 Alexander Lisovets. All rights reserved.
//

#import "ALHuman.h"

@class ALCar;

@interface ALWasher : ALHuman
@property (nonatomic, assign)   NSInteger   washPrice;
@property (nonatomic, readonly) ALCar       *car;

+ (ALWasher *)washer;

- (id)initWithSalary:(NSInteger)salary
          experience:(NSInteger)experience
           washPrice:(NSInteger)washPrice;

- (void)washCar:(ALCar *)car;

@end
