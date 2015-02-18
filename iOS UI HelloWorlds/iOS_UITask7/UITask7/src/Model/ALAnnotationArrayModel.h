//
//  ALAnnotationArrayModel.h
//  UITask7
//
//  Created by Alexander Lisovets on 11/14/14.
//  Copyright (c) 2014 Example. All rights reserved.
//

#import "ALArrayModel.h"
#import "ALAnnotationModel.h"

@interface ALAnnotationArrayModel : ALArrayModel

+ (instancetype)arrayModelWithLocationModel:(ALLocationModel *)locationModel;

@end
