//
//  main.m
//  example1
//
//  Created by Alexander Lisovets on 8/13/14.
//  Copyright (c) 2014 Alexander Lisovets. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ALCreature.h"

NSMutableArray *ALGenerateCreatures();

static const NSInteger ALMaxParentNumber    = 5;
static const NSInteger ALMaxChildNumber     = 3;

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSMutableArray *creatures = ALGenerateCreatures();
        
        for (ALCreature *creature in creatures){
            [creature sayHello];
        }
        
        NSLog(@"\n");
        
        for (ALCreature *creature in creatures){
            if(creature.gender == ALGenderMale){
                [creature makeWar];
            } else {
                [creature giveBirth];
            }
        }
    }
    
    return 0;
}


NSMutableArray *ALGenerateCreatures() {
    NSMutableArray *creatures = [NSMutableArray array];
    
    for (NSInteger index = 0; index < ALMaxParentNumber; index++) {
        ALCreature *creature = [ALCreature randomCreature];
        
        NSInteger childNumber = arc4random_uniform(ALMaxChildNumber) + 1;
        for (NSInteger childIndex = 0; childIndex < childNumber; childIndex++) {
            [creature addChild:[ALCreature randomCreature]];
        }
        
        [creatures addObject:creature];
    }
    
    return creatures;
}


