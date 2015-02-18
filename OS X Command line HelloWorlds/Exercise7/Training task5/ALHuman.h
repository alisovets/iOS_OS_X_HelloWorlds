//
//  ALEmployee.h
//  training task3
//
//  Created by Alexander Lisovets on 8/15/14.
//  Copyright (c) 2014 Alexander Lisovets. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "ALObservableObject.h"
#import "ALHandler.h"

static const NSInteger ALHumanDefaultSalary      = 0;
static const NSInteger ALHumanDefaultExperience  = 0;

@class ALRoom;

@interface ALHuman : ALObservableObject<ALHandler>
@property (atomic, assign)      ALRoom      *room;
@property (nonatomic, assign)   NSInteger   salary;
@property (nonatomic, assign)   NSInteger   experience;
@property (atomic, readonly)    NSInteger   moneySupply;
@property (atomic, assign)      BOOL        busy;

- (id)initWithSalary:(NSInteger)salary experience:(NSInteger)experience;

- (NSInteger)giveMoney;
- (void)receiveMoneySum:(NSInteger)moneySum;
- (void)takeMoneyFromHuman:(ALHuman *)human;

- (void)handleOperandInBackground:(id)operand;
- (void)handleOperandInForeground:(id)operand;

@end

