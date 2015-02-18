//
//  main.m
//  training task4
//
//  Created by Alexander Lisovets on 8/21/14.
//  Copyright (c) 2014 Alexander Lisovets. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ALAdministrativeBuilding.h"
#import "ALWashBuilding.h"
#import "ALWashingController.h"

int main(int argc, const char * argv[])
{
    @autoreleasepool {
        ALWashingController *washingController = [ALWashingController controller];
        [washingController run];
    }
    
    return 0;
}


        


