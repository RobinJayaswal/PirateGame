//
//  weaponClass.h
//  newPirateGame
//
//  Created by RobinJayaswal on 12/4/14.
//  Copyright (c) 2014 RobinJayaswal. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface weaponClass : NSObject

@property (nonatomic) int damageStat;
@property (strong, nonatomic) NSString *currentWeapon;

-(void) startWithFists;
-(void) changeWeaponToSword;
-(void) changeWeaponToGun;
-(void) changeWeaponToFineSword;
-(void) noChangeToWeapon;

@end
