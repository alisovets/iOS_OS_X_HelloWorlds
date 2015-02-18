//
//  ALObserver.h
//  training task4
//
//  Created by Alexander Lisovets on 8/21/14.
//  Copyright (c) 2014 Alexander Lisovets. All rights reserved.
//

#import <Foundation/Foundation.h>

@class  ALObservableObject;
@class  ALHuman;

@protocol ALObserver <NSObject>
@optional
- (void)humanIsReadyForWork:(ALHuman *)human;
- (void)humanDidFinishWork:(ALHuman *)human;

@end
