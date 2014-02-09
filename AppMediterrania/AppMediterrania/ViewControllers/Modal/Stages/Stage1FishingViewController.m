//
//  Stage1FishingViewController.m
//  AppMediterrania
//
//  Created by Nestor Malet on 31/01/14.
//  Copyright (c) 2014 Storn.es. All rights reserved.
//

#import <AudioToolbox/AudioToolbox.h>
#import "Stage1FishingViewController.h"
#import "StageManager.h"

@interface Stage1FishingViewController (){
    SystemSoundID soundID;
}

@end

@implementation Stage1FishingViewController
@synthesize nextButton;

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

    [nextButton setEnabled: NO];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (void) stopAudio{
    if(soundID){
        AudioServicesDisposeSystemSoundID(soundID);
    }
}

- (void) play:(NSString *)name{
    [self stopAudio];
    
    NSURL *url = [NSURL fileURLWithPath:[NSString stringWithFormat:@"%@/%@", [[NSBundle mainBundle] resourcePath], name]];
    
    AudioServicesCreateSystemSoundID((__bridge CFURLRef)url, &soundID);
    AudioServicesPlaySystemSound (soundID);
    
    [nextButton setEnabled: YES];
}

#pragma mark - Actions

- (IBAction)nextButton:(id)sender{
    [self stopAudio];

    [[StageManager sharedInstance] markAsCompleted: 1];
    
    [[NSNotificationCenter defaultCenter] postNotificationName:NOT_BACK_TO_MAP object:self];
}


- (IBAction)clickSea:(id)sender{
    [self play:@"bubbles.mp3"];
}

- (IBAction)clickSky:(id)sender{
    [self play:@"seagull.mp3"];
}

@end
