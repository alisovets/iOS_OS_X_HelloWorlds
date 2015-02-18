//
//  Creature.h
//  example1
//
//  Created by Alexander Lisovets on 8/13/14.
//  Copyright (c) 2014 Alexander Lisovets. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ALCreature : NSObject
@property (nonatomic, copy)     NSString    *name;
@property (nonatomic, assign)   NSInteger   age;
@property (nonatomic, assign)   double      weight;
@property (nonatomic, readonly) NSArray     *children;

+ (ALCreature *)randomCreature;

- (id)initWithName:(NSString *)name
               age:(NSInteger)age
            weight:(double)weight;

- (void)sayHello;
- (ALCreature *)performGenderSpecificOperation;

- (void)addChild:(ALCreature *)child;
- (void)deleteChild:(ALCreature *)child;

@end
