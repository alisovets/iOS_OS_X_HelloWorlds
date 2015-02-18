//
//  NSFetchedResultsController+ALExtension.h
//  UITask6
//
//  Created by Alexander Lisovets on 10/22/14.
//  Copyright (c) 2014 Alexander Lisovets. All rights reserved.
//

#import <CoreData/CoreData.h>

@interface NSFetchedResultsController (ALExtension)

+ (instancetype)controllerWithFetchRequest:(NSFetchRequest *)fetchRequest;

@end
