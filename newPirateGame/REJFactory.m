//
//  REJFactory.m
//  newPirateGame
//
//  Created by RobinJayaswal on 12/2/14.
//  Copyright (c) 2014 RobinJayaswal. All rights reserved.
//

#import "REJFactory.h"
#import "REJTile.h"

@implementation REJFactory

-(NSArray *)tiles {
    REJTile *tile1 = [[REJTile alloc] init];
    tile1.levelDescription = @"Aye Aye Matey! You have just stumbled upon an old treasure map, and your life will never be the same. You must set sail tomorrow. There are 12 worlds to explore, existing in a 3x4 grid. Use the arrows to navigate.";
    tile1.backgroundImage = [UIImage imageNamed:@"PirateStart.jpg"];
    tile1.actionButtonName = @"Grab the sword!";
    
    REJTile *tile2 = [[REJTile alloc] init];
    tile2.levelDescription = @"Looks like someone's taken a liking to you. He may get pretty annoying sometimes, but he could be good company for the voyages ahead. He's yours if you want him.";
    tile2.backgroundImage = [UIImage imageNamed:@"PirateParrot.jpg"];
    tile2.actionButtonName = @"Put parrot on shoulder.";

    
    REJTile *tile3 = [[REJTile alloc] init];
    tile3.levelDescription = @"Arg enemy pirates have captured you. They have made you walk the plank, but luckily as you hit the water you see your ship has come back for you. If you swim as fast as you can you may just escape alive, though surely not unscarred as the sharks are already circling.";
    tile3.backgroundImage = [UIImage imageNamed:@"PiratePlank.jpg"];
    tile3.actionButtonName = @"Walk the plank";
    
    NSArray *column1 = [[NSArray alloc] initWithObjects:tile1, tile2, tile3, nil];
    
    REJTile *tile4 = [[REJTile alloc] init];
    tile4.levelDescription = @"You are in a friendly dock. Make sure to pick up the things you need while you can.";
    tile4.backgroundImage = [UIImage imageNamed:@"PirateFriendlyDock.jpg"];
    tile4.actionButtonName = @"Grab Replenishments";
    
    REJTile *tile5 = [[REJTile alloc] init];
    tile5.levelDescription = @"Treasure!! You have found a small treasure, which will allow you to buy all the things you need to boost your health, as well as upgrade your weapons.";
    tile5.backgroundImage = [UIImage imageNamed:@"PirateTreasure.jpeg"];
    tile5.actionButtonName = @"Grab Treasure";
    
    REJTile *tile6 = [[REJTile alloc] init];
    tile6.levelDescription = @"Another ship seeking the treasure map you posess! Prepare for battle!";
    tile6.backgroundImage = [UIImage imageNamed:@"PirateShipBattle.jpeg"];
    tile6.actionButtonName = @"Sink enemy ship";
    
    NSArray *column2 = [[NSArray alloc] initWithObjects:tile4, tile5, tile6, nil];
    
    REJTile *tile7 = [[REJTile alloc] init];
    tile7.levelDescription = @"You have reached the lair of the greatest blacksmith in the land. His sword will give you greater strength and agility.";
    tile7.backgroundImage = [UIImage imageNamed:@"PirateBlacksmith.jpeg"];
    tile7.actionButtonName = @"Take welded sword";
    
    REJTile *tile8 = [[REJTile alloc] init];
    tile8.levelDescription = @"Pirates have boarded your ship! Take care of them!";
    tile8.backgroundImage = [UIImage imageNamed:@"PirateAttack.jpg"];
    tile8.actionButtonName = @"Fend off invading pirates";
    
    REJTile *tile9 = [[REJTile alloc] init];
    tile9.levelDescription = @"A group of pirates you have defeated carried a collection of fine weapons. Claim a revolver for yourself.";
    tile9.backgroundImage = [UIImage imageNamed:@"PirateWeapons.jpeg"];
    tile9.actionButtonName = @"Pick up Revolver";
    
    NSArray *column3 = [[NSArray alloc] initWithObjects:tile7, tile8, tile9, nil];
    
    REJTile *tile10 = [[REJTile alloc] init];
    tile10.levelDescription = @"The kraken has attacked your ship! The whole thing is going down. You should have avoided the Kraken's territory, this seems to be the end for you.";
    tile10.backgroundImage = [UIImage imageNamed:@"PirateOctopusAttack.jpg"];
    tile10.actionButtonName = @"Fight Kraken";
    
    REJTile *tile11 = [[REJTile alloc] init];
    tile11.levelDescription = @"Ahoy! The treasure you have sought! You are rich beyond your imagination. Sail for the final world at the corner opposite where you started to reach land and live the life you dreamed of.";
    tile11.backgroundImage = [UIImage imageNamed:@"PirateTreasurer2.jpeg"];
    tile11.actionButtonName = @"Loot sunken ship";
    
    REJTile *tile12 = [[REJTile alloc] init];
    tile12.levelDescription = @"But alas! Captain Longbeard, the most feared pirate on the sea, has heard of your discovery and has come to take it. One final battle for you!";
    tile12.backgroundImage = [UIImage imageNamed:@"PirateBoss.jpeg"];
    tile12.actionButtonName = @"Fight Captain";
    
    NSArray *column4 = [[NSArray alloc] initWithObjects:tile10, tile11, tile12, nil];
    
    NSArray *tiles = [[NSArray alloc] initWithObjects:column1, column2, column3, column4, nil];
    
    return tiles;
    
}

-(characterClass *)character {
    characterClass *character = [[characterClass alloc] init];
    character.health = 30;
    character.damageStat = 5;
    return character;
}

-(bossClass *)boss {
    bossClass *boss = [[bossClass alloc] init];
    boss.bossHealth = 50;
    return boss;
}

@end
