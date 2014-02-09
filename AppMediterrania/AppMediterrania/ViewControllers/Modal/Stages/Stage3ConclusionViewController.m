//
//  Stage3ConclusionViewController.m
//  AppMediterrania
//
//  Created by Nestor Malet on 03/02/14.
//  Copyright (c) 2014 Storn.es. All rights reserved.
//

#import "Stage3ConclusionViewController.h"
#import "StageManager.h"

@interface Stage3ConclusionViewController ()

@end

@implementation Stage3ConclusionViewController

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
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (IBAction)nextButton:(id)sender{
    [[StageManager sharedInstance] markAsCompleted: 3];
    [[NSNotificationCenter defaultCenter] postNotificationName:NOT_BACK_TO_MAP object:self];
}


@end
