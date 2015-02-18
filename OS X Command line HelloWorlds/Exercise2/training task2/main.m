//
//  main.m
//  training task2
//
//  Created by Alexander Lisovets on 8/14/14.
//  Copyright (c) 2014 Alexander Lisovets. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ALCreature.h"

NSMutableArray *ALGenerateCreatures();

static const NSInteger ALMaxParentNumber    = 10;

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSMutableArray *creatures = ALGenerateCreatures();
        for (ALCreature *creature in creatures){
            [creature performGenderSpecificOperation];
        }
    }
    
    return 0;
}


NSMutableArray *ALGenerateCreatures() {
    NSMutableArray *creatures = [NSMutableArray array];
    
    for (NSInteger index = 0; index <= ALMaxParentNumber; index++) {
        ALCreature *creature = [ALCreature randomCreature];
        [creatures addObject:creature];
    }
    
    return creatures;
}

