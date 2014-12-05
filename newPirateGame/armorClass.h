//
//  armorClass.h
//  newPirateGame
//
//  Created by RobinJayaswal on 12/4/14.
//  Copyright (c) 2014 RobinJayaswal. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface armorClass : NSObject

@property (nonatomic) int healthStat;
@property (strong, nonatomic) NSString *currentArmor;


-(void) changeArmorToParrotSidekick;
-(void) changeArmorToSteelVest;

@end
