//
//  ALManagedArrayModel.h
//  UITask6
//
//  Created by Alexander Lisovets on 10/30/14.
//  Copyright (c) 2014 Alexander Lisovets. All rights reserved.
//

#import "ALArrayModel.h"

@class ALUserModel;

@interface ALManagedArrayModel : ALArrayModel<NSFetchedResultsControllerDelegate>
@property (nonatomic, readonly) NSFetchedResultsController  *controller;

+ (instancetype)modelWithUserModel:(ALUserModel *)userModel entityClass:(Class)entityClass;

- (instancetype)initWithUserModel:(ALUserModel *)userModel entityClass:(Class)entityClass;

@end
