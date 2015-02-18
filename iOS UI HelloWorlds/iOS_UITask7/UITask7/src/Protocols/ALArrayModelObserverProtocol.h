//
//  ALArrayModelObserverProtocol.h
//  UITask7
//
//  Created by Alexander Lisovets on 11/10/14.
//  Copyright (c) 2014 Example. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ALArrayModel.h"

@protocol ALArrayModelObserverProtocol <NSObject>
- (void)arrayModel:(ALArrayModel *)arrayModel didAddRowAtIndex:(NSNumber *)index;
- (void)arrayModel:(ALArrayModel *)arrayModel didDeleteRowAtIndex:(NSNumber *)index;

@end
