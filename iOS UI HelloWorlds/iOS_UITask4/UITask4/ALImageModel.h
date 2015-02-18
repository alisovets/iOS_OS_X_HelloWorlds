//
//  ALImageModel.h
//  UITask4_prep
//
//  Created by Alexander Lisovets on 9/19/14.
//  Copyright (c) 2014 Alexander Lisovets. All rights reserved.
//

#import <Foundation/Foundation.h>
#include "ALAbstractModel.h"

@interface ALImageModel : ALAbstractModel<NSCoding>
@property (nonatomic, readonly)   UIImage   *image;
@property (nonatomic, readonly)   NSURL     *url;

- (instancetype)initWithURL:(NSURL *)url;

@end
