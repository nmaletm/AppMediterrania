//
//  Stage1BasketViewController.m
//  AppMediterrania
//
//  Created by Nestor Malet on 31/01/14.
//  Copyright (c) 2014 Storn.es. All rights reserved.
//

#import "Stage1BasketViewController.h"

@interface Stage1BasketViewController ()

@end

@implementation Stage1BasketViewController

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


- (IBAction)nextButton:(id)sender{
    [[NSNotificationCenter defaultCenter] postNotificationName:NOT_NEXT_SUB_LEVEL object:self];
}

@end