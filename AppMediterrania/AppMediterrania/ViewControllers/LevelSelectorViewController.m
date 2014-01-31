//
//  LevelSelectorViewController.m
//  AppMediterrania
//
//  Created by Nestor Malet on 31/01/14.
//  Copyright (c) 2014 Storn.es. All rights reserved.
//

#import "LevelSelectorViewController.h"
#import "LevelManager.h"

@interface LevelSelectorViewController ()

@end

@implementation LevelSelectorViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)level1:(id)sender{
    [[LevelManager sharedInstance] setNewLevel:[NSNumber numberWithInt:1]];
    [[NSNotificationCenter defaultCenter] postNotificationName:BACK_TO_MAP object:self];
}
- (IBAction)level2:(id)sender{
    [[LevelManager sharedInstance] setNewLevel:[NSNumber numberWithInt:2]];
    [[NSNotificationCenter defaultCenter] postNotificationName:BACK_TO_MAP object:self];
}
- (IBAction)level3:(id)sender{
    [[LevelManager sharedInstance] setNewLevel:[NSNumber numberWithInt:3]];
    [[NSNotificationCenter defaultCenter] postNotificationName:BACK_TO_MAP object:self];
}

@end
