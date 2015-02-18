//
//  ALObserver.h
//  UITask2
//
//  Created by Alexander Lisovets on 9/9/14.
//  Copyright (c) 2014 Alexander Lisovets. All rights reserved.
//

#import <Foundation/Foundation.h>

@class ALArrayModel;

@protocol ALArrayModelObserver <NSObject>
- (void)arrayModel:(ALArrayModel *)arrayModel didAddRowAtIndexPath:(NSIndexPath *)indexPath;
- (void)arrayModel:(ALArrayModel *)arrayModel didDeletedRowAtIndexPath:(NSIndexPath *)indexPath;

@end
