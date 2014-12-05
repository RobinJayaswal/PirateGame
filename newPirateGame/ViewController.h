//
//  ViewController.h
//  newPirateGame
//
//  Created by RobinJayaswal on 11/29/14.
//  Copyright (c) 2014 RobinJayaswal. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "characterClass.h"
#import "bossClass.h"

@interface ViewController : UIViewController

//instanceVariables
@property (nonatomic,readwrite) CGPoint currentPoint;
@property (strong, nonatomic) NSArray *tiles;
@property (strong, nonatomic) characterClass *character;
@property (strong, nonatomic) bossClass *boss;


//properties

@property (strong, nonatomic) IBOutlet UIImageView *backgroundImageView;
@property (strong, nonatomic) IBOutlet UILabel *healthStatLabel;
@property (strong, nonatomic) IBOutlet UILabel *damageStatLabel;
@property (strong, nonatomic) IBOutlet UILabel *weaponLabel;
@property (strong, nonatomic) IBOutlet UILabel *armorLabel;
@property (strong, nonatomic) IBOutlet UILabel *levelDescriptionLabel;
@property (strong, nonatomic) IBOutlet UIButton *actionButton;
@property (strong, nonatomic) IBOutlet UIButton *northButton;
@property (strong, nonatomic) IBOutlet UIButton *eastButton;
@property (strong, nonatomic) IBOutlet UIButton *westButton;
@property (strong, nonatomic) IBOutlet UIButton *southButton;

//IBActions
- (IBAction)actionButtonPressed:(UIButton *)sender;
- (IBAction)northButtonPressed:(UIButton *)sender;
- (IBAction)eastButtonPressed:(UIButton *)sender;
- (IBAction)westButtonPressed:(UIButton *)sender;
- (IBAction)southButtonPressed:(UIButton *)sender;



@end

