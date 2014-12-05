//
//  weaponClass.m
//  newPirateGame
//
//  Created by RobinJayaswal on 12/4/14.
//  Copyright (c) 2014 RobinJayaswal. All rights reserved.
//

#import "weaponClass.h"

@implementation weaponClass

-(void) startWithFists
{
    self.damageStat = 5;
    self.currentWeapon = @"Fists";
}

-(void) changeWeaponToGun
{
    self.damageStat = 30;
    self.currentWeapon = @"Revolver";
}

-(void) changeWeaponToSword
{
    self.damageStat = 15;
    self.currentWeapon = @"Sword";
}

-(void) changeWeaponToFineSword{
    self.damageStat = 22;
    self.currentWeapon = @"Finely Crafted Sword";
}

-(void) noChangeToWeapon
{
    self.damageStat = self.damageStat;
    self.currentWeapon = self.currentWeapon;
}

@end
