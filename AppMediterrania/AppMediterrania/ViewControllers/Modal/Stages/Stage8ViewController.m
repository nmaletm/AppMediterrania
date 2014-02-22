//
//  Stage8ViewController.m
//  AppMediterrania
//
//  Created by Nestor Malet on 30/01/14.
//  Copyright (c) 2014 Storn.es. All rights reserved.
//

#import "Stage8ViewController.h"
#import "LevelManager.h"

@interface Stage8ViewController ()

@end

@implementation Stage8ViewController{
    NSString *background;
    BOOL hasBackButton;
}

@synthesize imageView;
@synthesize backButton;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil background:(NSString *)theBackground hasBackButton:(BOOL)itHasBackButton
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        background = theBackground;
        hasBackButton = itHasBackButton;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	   
    UIImage *image = [UIImage imageNamed: background];
    [imageView setImage:image];
    
    if(!hasBackButton){
        [backButton setHidden: YES];
    }
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)backAction:(id)sender{
    [[NSNotificationCenter defaultCenter] postNotificationName:CLICK_BACK_BUTTON object:self];
}

@end
