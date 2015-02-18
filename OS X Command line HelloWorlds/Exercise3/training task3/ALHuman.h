//
//  ALEmployee.h
//  training task3
//
//  Created by Alexander Lisovets on 8/15/14.
//  Copyright (c) 2014 Alexander Lisovets. All rights reserved.
//

#import <Foundation/Foundation.h>

static const NSInteger ALHumanDefaultSalary      = 0;
static const NSInteger ALHumanDefaultExperience  = 0;

@class ALRoom;

@interface ALHuman : NSObject
@property (nonatomic, assign)   NSInteger   salary;
@property (nonatomic, assign)   NSInteger   experience;
@property (nonatomic, readonly) NSInteger   moneySupply;
@property (nonatomic, assign)   ALRoom      *room;

@property (nonatomic, assign, getter = isBusy) BOOL busy;

- (id)initWithSalary:(NSInteger)salary experience:(NSInteger)experience;

- (void)giveMoneyToHuman:(ALHuman *)human;
- (void)receiveMoneySum:(NSInteger)moneySum;

@end

