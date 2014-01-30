//
//  MapViewController.m
//  AppMediterrania
//
//  Created by Nestor Malet on 28/01/14.
//  Copyright (c) 2014 Storn.es. All rights reserved.
//

#import "MapViewController.h"

#import "Stage8ViewController.h"

@interface MapViewController ()

@end

@implementation MapViewController

@synthesize b_stage1;
@synthesize b_stage2;
@synthesize b_stage3;
@synthesize b_stage4;
@synthesize b_stage5;
@synthesize b_stage6;
@synthesize b_stage7;
@synthesize b_stage8;

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
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark Actions

- (IBAction)showInformation:(id)sender{
    
}

#pragma mark Actions stages
- (IBAction)stage1:(id)sender{
    
}

- (IBAction)stage2:(id)sender{
    
}

- (IBAction)stage3:(id)sender{
    
}

- (IBAction)stage4:(id)sender{
    
}

- (IBAction)stage5:(id)sender{
    
}

- (IBAction)stage6:(id)sender{
    
}

- (IBAction)stage7:(id)sender{
    
}

- (IBAction)stage8:(id)sender{
    Stage8ViewController *viewController = [[Stage8ViewController alloc] init];
    [self presentViewController:viewController animated:YES completion: nil];
}

@end
