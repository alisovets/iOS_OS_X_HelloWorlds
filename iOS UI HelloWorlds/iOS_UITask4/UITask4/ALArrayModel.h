//
//  ALImageLabelArray.h
//  UITask2
//
//  Created by Alexander Lisovets on 9/8/14.
//  Copyright (c) 2014 Alexander Lisovets. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ALAbstractModel.h"

static NSString * const ALArchiveFile = @"uitask4";

@interface ALArrayModel : ALAbstractModel<NSCoding>
@property (nonatomic, readonly, getter = isSaved) BOOL saved;

- (void)addModel:(ALAbstractModel *)model;
- (void)removeModel:(ALAbstractModel *)model;
- (void)removeModelAtIndex:(NSUInteger)index;
- (void)insertModel:(ALAbstractModel *)model atIndex:(NSUInteger)index;
- (void)moveFromIndex:(NSUInteger)fromIndex toIndex:(NSUInteger)toIndex;

- (ALAbstractModel *)modelAtIndex:(NSUInteger)index;

- (BOOL)containsModel:(ALAbstractModel *)model;
- (NSInteger)indexOfModel:(ALAbstractModel *)model;
- (NSUInteger)count;

- (id)objectAtIndexedSubscript:(NSUInteger)index;
- (void)setObject:(id)object atIndexedSubscript:(NSUInteger)index;

@end
