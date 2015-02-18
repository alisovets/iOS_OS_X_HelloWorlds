//
//  ALManager.h
//  training task3
//
//  Created by Alexander Lisovets on 8/15/14.
//  Copyright (c) 2014 Alexander Lisovets. All rights reserved.
//

#import "ALHuman.h"

@interface ALManager : ALHuman<ALObserver>

+ (ALManager *)manager;

- (void)makeProfit;

@end
