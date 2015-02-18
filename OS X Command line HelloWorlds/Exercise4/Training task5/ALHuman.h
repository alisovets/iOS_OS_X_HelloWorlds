//
//  ALEmployee.h
//  training task3
//
//  Created by Alexander Lisovets on 8/15/14.
//  Copyright (c) 2014 Alexander Lisovets. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "ALObservableObject.h"

static const NSInteger ALHumanDefaultSalary      = 0;
static const NSInteger ALHumanDefaultExperience  = 0;

@class ALRoom;

@interface ALHuman : ALObservableObject<ALObserver>
@property (nonatomic, assign)   NSInteger   salary;
@property (nonatomic, assign)   NSInteger   experience;
@property (nonatomic, readonly) NSInteger   moneySupply;

@property (nonatomic, assign)   ALRoom      *room;

@property (nonatomic, assign, getter = isBusy) BOOL busy;

- (id)initWithSalary:(NSInteger)salary experience:(NSInteger)experience;

- (NSInteger)giveMoney;
- (void)receiveMoneySum:(NSInteger)moneySum;
- (void)takeMoneyFromHuman:(ALHuman *)human;

@end

