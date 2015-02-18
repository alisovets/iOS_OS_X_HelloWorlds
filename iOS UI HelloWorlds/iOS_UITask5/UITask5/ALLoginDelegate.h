//
//  ALLoginDelegate.h
//  UITask5
//
//  Created by Alexander Lisovets on 10/10/14.
//  Copyright (c) 2014 Alexander Lisovets. All rights reserved.
//

#import <Foundation/Foundation.h>

@class ALLoginContext;

@protocol ALLoginDelegate <NSObject>

- (void)context:(ALLoginContext *)context didFinishWithSuccess:(BOOL)success;

@end
