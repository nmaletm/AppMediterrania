//
//  Stage1SeasonsViewController.h
//  AppMediterrania
//
//  Created by Nestor Malet on 31/01/14.
//  Copyright (c) 2014 Storn.es. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Stage1SeasonsViewController : UIViewController

@property (strong, nonatomic) IBOutlet UIButton *button_summer;
@property (strong, nonatomic) IBOutlet UIButton *button_autumn;
@property (strong, nonatomic) IBOutlet UIButton *button_winter;
@property (strong, nonatomic) IBOutlet UIButton *button_spring;

@property (strong, nonatomic) IBOutlet UIImageView *background;

- (IBAction)nextButton:(id)sender;

- (IBAction)changeSeason:(id)sender;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil withBackground:(NSString *)theBackgroundName;

@end
