//
//  Stage3ViewController.m
//  AppMediterrania
//
//  Created by Nestor Malet on 02/02/14.
//  Copyright (c) 2014 Storn.es. All rights reserved.
//

#import "Stage3ViewController.h"

@interface Stage3ViewController (){
    NSString *background;
}

@end

@implementation Stage3ViewController
@synthesize nextButton;
@synthesize nextSubStageButton;
@synthesize backgroundImage;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil;
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
    
    [nextButton setEnabled: NO];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    
}

- (void) setBackground:(NSString*) newBackground{
    background = newBackground;
    UIImage *image = [UIImage imageNamed: background];
    [backgroundImage setImage:image];
}

- (void) nextButtonEnabled:(BOOL) enabled{
    [nextButton setEnabled:enabled];
}
- (void) nextSubStageButtonEnabled:(BOOL) enabled{
    [nextSubStageButton setEnabled:enabled];
}
#pragma mark - Actions

- (IBAction)nextButton:(id)sender{
    
    [[NSNotificationCenter defaultCenter] postNotificationName:NOT_NEXT_SUB_LEVEL object:self];
}

- (IBAction)nextSubStage:(id)sender{
    [[NSNotificationCenter defaultCenter] postNotificationName:NOT_NEXT_SUB_LEVEL object:self];
}

@end
