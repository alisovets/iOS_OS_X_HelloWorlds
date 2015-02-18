//
//  ALImageLabelArray.h
//  UITask2
//
//  Created by Alexander Lisovets on 9/8/14.
//  Copyright (c) 2014 Alexander Lisovets. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ALModel.h"
#import "ALAbstractModel.h"

static NSString * const ALArchiveFile = @"uitask3";

@interface ALArrayModel : ALAbstractModel<NSCoding>
@property (nonatomic, readonly, getter = isSaved) BOOL saved;

- (void)addModel:(ALModel *)model;
- (void)removeModel:(ALModel *)model;
- (void)removeModelAtIndex:(NSUInteger)index;
- (void)insertModel:(ALModel *)model atIndex:(NSUInteger)index;
- (void)moveFromIndex:(NSUInteger)fromIndex toIndex:(NSUInteger)toIndex;

- (ALModel *)modelAtIndex:(NSUInteger)index;

- (BOOL)containsModel:(ALModel *)model;
- (NSInteger)indexOfModel:(ALModel *)model;
- (NSUInteger)count;

- (id)objectAtIndexedSubscript:(NSUInteger)index;
- (void)setObject:(id)object atIndexedSubscript:(NSUInteger)index;

@end
