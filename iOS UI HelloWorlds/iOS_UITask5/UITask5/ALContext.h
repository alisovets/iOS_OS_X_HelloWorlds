//
//  ALContext.h
//  UITask5
//
//  Created by Alexander Lisovets on 10/1/14.
//  Copyright (c) 2014 Alexander Lisovets. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ALContext : NSObject
- (void)execute;
- (void)cancel;

- (void)executeInBackground;

@end
