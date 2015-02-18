//
//  ALImageCache.h
//  UITask4
//
//  Created by Alexander Lisovets on 9/24/14.
//  Copyright (c) 2014 Alexander Lisovets. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ALImageModel.h"

@interface ALImageCache : NSObject

+ (id)sharedCache;

- (void)addModel:(ALImageModel *)model;
- (void)removeModel:(ALImageModel *)model;
- (ALImageModel *)imageModelWithURL:(NSURL *)url;

@end
