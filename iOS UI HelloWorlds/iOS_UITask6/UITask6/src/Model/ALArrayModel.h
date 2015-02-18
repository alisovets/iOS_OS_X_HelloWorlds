//
//  ALImageLabelArray.h
//  UITask2
//
//  Created by Alexander Lisovets on 9/8/14.
//  Copyright (c) 2014 Alexander Lisovets. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ALAbstractModel.h"

@interface ALArrayModel : ALAbstractModel
@property (nonatomic, readonly) NSArray *array;

+ (instancetype)model;

- (void)addModel:(id<ALObservableModel>)model;
- (void)removeModel:(id<ALObservableModel>)model;
- (void)removeModelAtIndex:(NSUInteger)index;
- (void)insertModel:(id<ALObservableModel>)model atIndex:(NSUInteger)index;
- (void)moveFromIndex:(NSUInteger)fromIndex toIndex:(NSUInteger)toIndex;
- (void)replaceModels:(NSArray *)modelArray;

- (id<ALObservableModel>)modelAtIndex:(NSUInteger)index;

- (BOOL)containsModel:(id<ALObservableModel>)model;
- (NSInteger)indexOfModel:(id<ALObservableModel>)model;
- (NSUInteger)count;

- (id)objectAtIndexedSubscript:(NSUInteger)index;
- (void)setObject:(id)object atIndexedSubscript:(NSUInteger)index;

@end
