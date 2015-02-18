//
//  main.m
//  training task3
//
//  Created by Alexander Lisovets on 8/15/14.
//  Copyright (c) 2014 Alexander Lisovets. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ALAdministrativeBuilding.h"
#import "ALWashBuilding.h"
#import "ALWashRoom.h"

static const NSInteger ALWasherCount    = 1;
static const NSInteger ALCarCount       = 1;

ALAdministrativeBuilding *ALCreateAdministrativeBuilding();
ALWashBuilding *ALCreateWashBuilding();
void ALAddCarsInWashBuilding(ALWashBuilding *washBuilding, NSInteger carCount);

int main(int argc, const char * argv[])
{
    @autoreleasepool {
        ALAdministrativeBuilding *administrativeBuilding = ALCreateAdministrativeBuilding();
        ALWashBuilding *washBuilding = ALCreateWashBuilding();
        
        ALAddCarsInWashBuilding(washBuilding, ALCarCount);
        
        ALWasher *washer = [washBuilding idleHumanWithClass:[ALWasher class]];
        ALCar *car = [washBuilding waitingCar];
        [washer washCar:car];
        
        ALBookkeeper *bookkeeper = [administrativeBuilding humanWithClass:[ALBookkeeper class]];
        [washer giveMoneyToHuman:bookkeeper];
        [bookkeeper calculate];
        
        ALManager *manager = [administrativeBuilding humanWithClass:[ALManager class]];
        [bookkeeper giveMoneyToHuman:manager];
        [manager makeProfit];
    }
    
    return 0;
}

ALAdministrativeBuilding *ALCreateAdministrativeBuilding(){    
    ALAdministrativeBuilding *administrativeBuilding = [ALAdministrativeBuilding
                                                        administrativeBuilding];
    
    ALBookkeeper *bookkeper = [ALBookkeeper bookkeeper];
    ALManager *manager = [ALManager manager];
    
    [administrativeBuilding addHuman:bookkeper];
    [administrativeBuilding addHuman:manager];
    
    return administrativeBuilding;
}

ALWashBuilding *ALCreateWashBuilding(){
    ALWashBuilding *washBuilding = [ALWashBuilding washBuilding];
    
    for (NSInteger index = 0; index < ALWasherCount; index++ ) {
        ALWasher *washer = [ALWasher washer];
        [washBuilding addHuman:washer];
    }
    
    return washBuilding;
}

void ALAddCarsInWashBuilding(ALWashBuilding *washBuilding, NSInteger carCount){
    for (NSInteger index = 0; index < carCount; index++) {
        [washBuilding  addCar:[ALCar car]];
    }
}


