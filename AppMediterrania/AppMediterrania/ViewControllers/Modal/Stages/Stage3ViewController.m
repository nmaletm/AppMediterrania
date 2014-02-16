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
    
    [[NSNotificationCenter defaultCenter] postNotificationName:NEXT_BUTTON_DISABLED object:self];
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

- (void) nextSubStageButtonEnabled:(BOOL) enabled{
    [nextSubStageButton setEnabled:enabled];
}

#pragma mark - Actions

- (IBAction)nextSubStage:(id)sender{
    [[NSNotificationCenter defaultCenter] postNotificationName:CLICK_NEXT_BUTTON object:self];
}

@end
