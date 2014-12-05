//
//  ViewController.m
//  newPirateGame
//
//  Created by RobinJayaswal on 11/29/14.
//  Copyright (c) 2014 RobinJayaswal. All rights reserved.
//

#import "ViewController.h"
#import "REJFactory.h"
#import "REJTile.h"
#import "weaponClass.h"
#import "armorClass.h"
#import "characterClass.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    REJFactory *factory = [[REJFactory alloc] init];
    self.tiles = [factory tiles];
    self.character = [factory character];
    self.boss = [factory boss];
    self.currentPoint = CGPointMake(0, 0);
    [self updateTile];
//    [self west];
//    [self east];
//    [self north];
//    [self south];
    [self testForHiddenButtons];
    
    //initialTileWeaponSetup
    weaponClass *weapon = [[weaponClass alloc] init];
    [weapon startWithFists];
    self.weaponLabel.text = [weapon currentWeapon];
    self.damageStatLabel.text = [NSString stringWithFormat:@"%i", [weapon damageStat]];
    
    //initialTileArmorSetup
    self.armorLabel.text = @"No Armor";
    
    //initialHealthSetup
    
  
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - IBActions

- (IBAction)actionButtonPressed:(UIButton *)sender {
    
    //changing weapons and damage stats
    weaponClass *weapon = [[weaponClass alloc] init];
    
    if (self.currentPoint.x == 0 && self.currentPoint.y == 0){
        [weapon changeWeaponToSword];
        self.character.damageStat = 15;
        self.weaponLabel.text = [weapon currentWeapon];
        self.damageStatLabel.text = [NSString stringWithFormat:@"%i", [weapon damageStat]];
        self.actionButton.hidden = YES;
        
    }
    if (self.currentPoint.x == 2) {
        if (self.currentPoint.y == 0) {
            [weapon changeWeaponToFineSword];
            self.character.damageStat = 22;
            self.weaponLabel.text = [weapon currentWeapon];
            self.damageStatLabel.text = [NSString stringWithFormat:@"%i", [weapon damageStat]];
            self.actionButton.hidden = YES;

        }
        if (self.currentPoint.y == 2)
        {
            [weapon changeWeaponToGun];
            self.character.damageStat = 30;
            self.weaponLabel.text = [weapon currentWeapon];
            self.damageStatLabel.text = [NSString stringWithFormat:@"%i", [weapon damageStat]];
            self.actionButton.hidden = YES;
        }
    }
    
    //change armor
    [self changeArmor];
    
    //change health
    if ((self.currentPoint.x == 0 && self.currentPoint.y == 1) || (self.currentPoint.x == 1 && self.currentPoint.y == 0) || (self.currentPoint.x == 1 && self.currentPoint.y == 1) || (self.currentPoint.x == 3 && self.currentPoint.y == 1))
    {
        self.character.health = self.character.health +10;
        [self updateTile];
        self.actionButton.hidden = YES;
    }
        
    if ((self.currentPoint.x == 0 && self.currentPoint.y == 2) || (self.currentPoint.x == 1 && self.currentPoint.y == 2) || (self.currentPoint.x == 2 && self.currentPoint.y == 1))
    {
        self.character.health = self.character.health - 15;
        [self updateTile];
        self.actionButton.hidden = YES;
    }
    
    if (self.currentPoint.x == 3 && self.currentPoint.y == 2)
        
    {
        if (self.character.health > 0) {
            if (self.boss.bossHealth > 0)
            {
                int myDamage = self.character.damageStat;
                self.character.health = self.character.health - 10;
                self.boss.bossHealth = self.boss.bossHealth - myDamage;
                [self updateTile];
            }
            else
            {
                UIAlertView *victoryNotice = [[UIAlertView alloc] initWithTitle:@"Victory" message:@"You have defeated the boss and escaped the seas with immense fortunes." delegate:nil cancelButtonTitle:@"Game Beaten. Click to start again." otherButtonTitles:nil];
                [victoryNotice show];
                self.character = nil;
                self.boss = nil;
                [self viewDidLoad];
            }
        }
        else
        {
            UIAlertView *lossNotice = [[UIAlertView alloc] initWithTitle:@"Defeat" message:@"You were no match for the infamous captain. You have been slain and your treasure taken." delegate:nil cancelButtonTitle:@"Start Over" otherButtonTitles:nil];
            [lossNotice show];
            self.character = nil;
            self.boss = nil;
            [self viewDidLoad];
        }
    }
        
    //octopus attack
    if ((self.currentPoint.x == 3 && self.currentPoint.y == 0))
    {
        UIAlertView *krakenAttack = [[UIAlertView alloc] initWithTitle:@"The Kraken has sunk your ship!" message: @"You sink to the bottom of the ocean, and your journey comes to an end. Avoid this world the next time around." delegate:nil cancelButtonTitle:@"Start Over" otherButtonTitles: nil];
        [krakenAttack show];
        self.character = nil;
        self.boss = nil;
        [self viewDidLoad];
    }
}

- (IBAction)northButtonPressed:(UIButton *)sender {
    int xC = self.currentPoint.x;
    int yC = self.currentPoint.y+1;
    self.currentPoint = CGPointMake(xC, yC);
    REJFactory *factory = [[REJFactory alloc] init];
    self.tiles = [factory tiles];
    [self updateTile];
    [self testForHiddenButtons];
    self.actionButton.hidden = NO;
}

- (IBAction)eastButtonPressed:(UIButton *)sender {
    int xC = self.currentPoint.x+1;
    int yC = self.currentPoint.y;
    self.currentPoint = CGPointMake(xC, yC);
    REJFactory *factory = [[REJFactory alloc] init];
    self.tiles = [factory tiles];
    [self updateTile];
    [self testForHiddenButtons];
    self.actionButton.hidden = NO;
}

- (IBAction)westButtonPressed:(UIButton *)sender {
    int xC = self.currentPoint.x-1;
    int yC = self.currentPoint.y;
    self.currentPoint = CGPointMake(xC, yC);
    REJFactory *factory = [[REJFactory alloc] init];
    self.tiles = [factory tiles];
    [self updateTile];
    [self testForHiddenButtons];
    self.actionButton.hidden = NO;
}

- (IBAction)southButtonPressed:(UIButton *)sender {
    int xC = self.currentPoint.x;
    int yC = self.currentPoint.y-1;
    self.currentPoint = CGPointMake(xC, yC);
    REJFactory *factory = [[REJFactory alloc] init];
    self.tiles = [factory tiles];
    [self updateTile];
    [self testForHiddenButtons];
    self.actionButton.hidden = NO;
}

#pragma mark - Helper Methods

- (void) updateTile {
    REJTile *tile = [[self.tiles objectAtIndex:self.currentPoint.x] objectAtIndex:self.currentPoint.y];
    self.levelDescriptionLabel.text = tile.levelDescription;
    self.backgroundImageView.image = tile.backgroundImage;
    self.healthStatLabel.text = [NSString stringWithFormat:@"%i", self.character.health];
    [self.actionButton setTitle:tile.actionButtonName forState:UIControlStateNormal];
    
    
}



- (void)testForHiddenButtons {
    self.westButton.hidden = [self pointExistence:CGPointMake(self.currentPoint.x -1, self.currentPoint.y)];
    self.eastButton.hidden = [self pointExistence:CGPointMake(self.currentPoint.x +1, self.currentPoint.y)];
    self.southButton.hidden = [self pointExistence:CGPointMake(self.currentPoint.x, self.currentPoint.y -1)];
    self.northButton.hidden = [self pointExistence:CGPointMake(self.currentPoint.x, self.currentPoint.y +1)];
}

- (BOOL)pointExistence:(CGPoint)point
{
    if (point.x >= 0 && point.y >= 0 && point.x < [self.tiles count] && point.y < [[self.tiles objectAtIndex:point.x] count]){
        return NO;
    }
    
    else
    {
        return YES;
    }
}
//- (void) west {
//    if (self.currentPoint.x == 0) {
//        self.westButton.hidden = YES;
//        
//    }
//}
//
//- (void) east {
//    if (self.currentPoint.x == 3) {
//        self.eastButton.hidden = YES;
//    }
//}
//
//- (void) north {
//    if (self.currentPoint.y == 2) {
//        self.northButton.hidden = YES;
//    }
//    
//}
//- (void) south {
//    if (self.currentPoint.y == 0) {
//        self.southButton.hidden = YES;
//    }
//}

-(void) changeArmor
{
    armorClass *armor = [[armorClass alloc] init];
    if (self.currentPoint.x == 0 && self.currentPoint.y == 1)
    {   [armor changeArmorToParrotSidekick];
        self.armorLabel.text = [armor currentArmor];
    }
    if (self.currentPoint.x == 1 && self.currentPoint.y == 0)
    {
        [armor changeArmorToSteelVest];
        self.armorLabel.text = [armor currentArmor];
    }
}

@end
