//
//  Stage1SeasonsViewController.m
//  AppMediterrania
//
//  Created by Nestor Malet on 31/01/14.
//  Copyright (c) 2014 Storn.es. All rights reserved.
//

#import "Stage1SeasonsViewController.h"

@interface Stage1SeasonsViewController (){
    NSArray *buttons;
    NSArray *seasons;
    int currentSeason;
    NSString *backgroundName;
}

@end

@implementation Stage1SeasonsViewController
@synthesize button_summer;
@synthesize button_autumn;
@synthesize button_winter;
@synthesize button_spring;
@synthesize background;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil withBackground:(NSString *)theBackgroundName
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        backgroundName = theBackgroundName;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [[NSNotificationCenter defaultCenter] postNotificationName:NEXT_BUTTON_DISABLED object:self];

    buttons = [[NSArray alloc] initWithObjects:button_summer, button_autumn, button_winter, button_spring, nil];
    seasons = [[NSArray alloc] initWithObjects: @"summer", @"autumn", @"winter", @"spring", nil];
    currentSeason = 0;
    
    for(int i = 0; i < 4; i++){
        UIButton *button = [buttons objectAtIndex:i];
        [button setTag:i];
    }
    
    [self refreshBackground];
    [self refreshButtonStatus];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (void) refreshBackground{
    
    UIImage *image = [UIImage imageNamed: [NSString stringWithFormat:@"%@_%@", backgroundName, [seasons objectAtIndex:currentSeason]]];
    //[background setImage:image];
    
    [UIView transitionWithView:background
                      duration:0.3f
                       options:UIViewAnimationOptionTransitionCrossDissolve
                    animations:^{
                        background.image = image;
                    } completion:NULL];
}

- (void) refreshButtonStatus{
    for(int i = 0; i < 4; i++){
        UIButton *button = [buttons objectAtIndex:i];
        NSString *imageName;
        if(currentSeason == i){
            imageName = [NSString stringWithFormat:@"button_%@_h", [seasons objectAtIndex:i]];
        }
        else{
            imageName = [NSString stringWithFormat:@"button_%@", [seasons objectAtIndex:i]];
        }
        
        [button setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
        [button setImage:[UIImage imageNamed:imageName] forState:UIControlStateHighlighted];
    }
}

#pragma mark - Actions


- (IBAction)changeSeason:(id)sender{
    currentSeason = (int)[(UIButton *)sender tag];

    [self refreshBackground];
    [self refreshButtonStatus];
    
    [[NSNotificationCenter defaultCenter] postNotificationName:NEXT_BUTTON_ENABLED object:self];
}

@end
