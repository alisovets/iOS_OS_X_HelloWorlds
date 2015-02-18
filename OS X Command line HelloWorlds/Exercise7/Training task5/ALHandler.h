//
//  ALWorker.h
//  Training task6
//
//  Created by Alexander Lisovets on 8/29/14.
//  Copyright (c) 2014 Alexander Lisovets. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ALObserver.h"

@protocol ALHandler <NSObject>
- (void)handleOperand:(id)operand;

@end
