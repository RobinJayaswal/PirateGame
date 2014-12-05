//
//  REJFactory.h
//  newPirateGame
//
//  Created by RobinJayaswal on 12/2/14.
//  Copyright (c) 2014 RobinJayaswal. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "characterClass.h"
#import "bossClass.h"
@interface REJFactory : NSObject

-(NSArray *)tiles;
-(characterClass *)character;
-(bossClass *)boss;


@end
