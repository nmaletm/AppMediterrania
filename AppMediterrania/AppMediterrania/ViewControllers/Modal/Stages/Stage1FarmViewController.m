//
//  Stage1FarmViewController.m
//  AppMediterrania
//
//  Created by Nestor Malet on 31/01/14.
//  Copyright (c) 2014 Storn.es. All rights reserved.
//

#import <AudioToolbox/AudioToolbox.h>
#import "Stage1FarmViewController.h"

@interface Stage1FarmViewController (){
    SystemSoundID soundID;
}

@end

@implementation Stage1FarmViewController
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
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(nextSubLevel:) name:NOT_NEXT_SUB_LEVEL object:nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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

#pragma mark - Notifications
- (void) nextSubLevel:(NSNotification *)notification
{
    [self stopAudio];
}

#pragma mark - Actions


- (IBAction)clickGoat:(id)sender{
    [self play:@"goat.mp3"];
}

- (IBAction)clickSheep:(id)sender{
    [self play:@"sheep.mp3"];
}

- (IBAction)clickCow:(id)sender{
    [self play:@"cow.mp3"];
}

- (IBAction)clickPork:(id)sender{
    [self play:@"pork.mp3"];
}

- (IBAction)clickHen:(id)sender{
    [self play:@"hen.mp3"];
}

@end
