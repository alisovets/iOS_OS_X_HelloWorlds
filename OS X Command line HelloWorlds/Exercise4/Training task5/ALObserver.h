//
//  ALObserver.h
//  training task4
//
//  Created by Alexander Lisovets on 8/21/14.
//  Copyright (c) 2014 Alexander Lisovets. All rights reserved.
//

#import <Foundation/Foundation.h>

@class  ALObservableObject;

@protocol ALObserver <NSObject>
@optional
- (void)objectDidFinishProcessing:(ALObservableObject *)anObject;

@end
