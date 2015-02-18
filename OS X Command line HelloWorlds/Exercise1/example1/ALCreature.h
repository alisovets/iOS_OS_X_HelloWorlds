//
//  Creature.h
//  example1
//
//  Created by Alexander Lisovets on 8/13/14.
//  Copyright (c) 2014 Alexander Lisovets. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum ALGender {
    ALGenderMale,
    ALGenderFemale
} ALGender;

@interface ALCreature : NSObject
@property (nonatomic, assign)   ALGender    gender;
@property (nonatomic, copy)     NSString    *name;
@property (nonatomic, assign)   NSInteger   age;
@property (nonatomic, assign)   double      weight;
@property (nonatomic, readonly) NSArray     *children;

+ (ALCreature *)randomCreature;

- (id)initWithGender:(ALGender)gender
                name:(NSString *)name
                 age:(NSInteger)age
              weight:(double)weight;

- (instancetype)giveBirth;

- (void)makeWar;
- (void)sayHello;

- (void)addChild:(ALCreature *)child;
- (void)deleteChild:(ALCreature *)child;

@end
