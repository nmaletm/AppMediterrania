//
//  Stage2ViewController.m
//  AppMediterrania
//
//  Created by Nestor Malet on 02/02/14.
//  Copyright (c) 2014 Storn.es. All rights reserved.
//

#import "Stage2ViewController.h"
#import "StageManager.h"

@interface Stage2ViewController (){
    NSString *background;
}

@end

@implementation Stage2ViewController
@synthesize nextButton;
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

#pragma mark - Actions

- (IBAction)nextButton:(id)sender{
    [[StageManager sharedInstance] markAsCompleted: 2];

    [[NSNotificationCenter defaultCenter] postNotificationName:NOT_BACK_TO_MAP object:self];
}

- (IBAction)nextSubStage:(id)sender{
    [[NSNotificationCenter defaultCenter] postNotificationName:NOT_NEXT_SUB_LEVEL object:self];
}

@end
