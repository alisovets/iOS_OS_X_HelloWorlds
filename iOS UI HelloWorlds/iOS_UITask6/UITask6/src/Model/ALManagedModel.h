//
//  ALManagedModel.h
//  UITask6
//
//  Created by Alexander Lisovets on 10/21/14.
//  Copyright (c) 2014 Alexander Lisovets. All rights reserved.
//

#import <CoreData/CoreData.h>
#import "ALObservableModel.h"
#import "ALAbstractModel.h"
#import "NSObject+IDPOCExtensions.h"


@interface ALManagedModel : NSManagedObject<ALObservableModel>
@property (atomic, readonly) ALModelState  state;

+ (NSPredicate *)predicateWithModel:(ALManagedModel *)model;
+ (NSFetchRequest *)fetchRequestWithModel:(ALManagedModel *)model;

@end
