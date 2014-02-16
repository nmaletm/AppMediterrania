//
//  Stage8EndViewController.m
//  DietMed
//
//  Created by Nestor Malet on 16/02/14.
//  Copyright (c) 2014 Storn.es. All rights reserved.
//

#import "Stage8EndViewController.h"
#import "LevelManager.h"
#import "StageManager.h"

@interface Stage8EndViewController ()

@end

@implementation Stage8EndViewController

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

#pragma mark - Actions

- (IBAction)resetButton:(id)sender{
    [[StageManager sharedInstance] reset];
    [[NSNotificationCenter defaultCenter] postNotificationName:NOT_BACK_TO_MAP object:self];
}

@end
