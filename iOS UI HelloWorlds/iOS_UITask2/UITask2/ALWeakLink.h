//
//  ALWeakLink.h
//  training task4
//
//  Created by Alexander Lisovets on 8/21/14.
//  Copyright (c) 2014 Alexander Lisovets. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ALWeakLink : NSObject
@property (nonatomic, readonly) id target;

+ (instancetype)weakLinkWithTarget:(id)target;

- (instancetype)initWithTarget:(id)target;
- (BOOL)isEqualToWeakLink:(ALWeakLink *)weakLink;

@end
