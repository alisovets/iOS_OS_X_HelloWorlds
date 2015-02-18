//
//  ALObserver.h
//  UITask2
//
//  Created by Alexander Lisovets on 9/9/14.
//  Copyright (c) 2014 Alexander Lisovets. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ALModelObserver.h"

@class ALArrayModel;

@protocol ALArrayModelObserver <ALModelObserver>

- (void)arrayModel:(ALArrayModel *)arrayModel didAddRowAtIndexPath:(NSIndexPath *)indexPath;
- (void)arrayModel:(ALArrayModel *)arrayModel didDeleteRowAtIndexPath:(NSIndexPath *)indexPath;

@end
