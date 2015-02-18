//
//  ALCar.h
//  training task3
//
//  Created by Alexander Lisovets on 8/15/14.
//  Copyright (c) 2014 Alexander Lisovets. All rights reserved.
//

#import <Foundation/Foundation.h>

@class ALWasher;

@interface ALCar : NSObject
@property (atomic, assign, getter = isWashed)    BOOL        washed;
@property (atomic, assign)                       NSInteger   moneySupply;

+ (ALCar *)car;

- (id)initWithMoney:(NSInteger)sum;

@end
