//
//  MapViewController.m
//  AppMediterrania
//
//  Created by Nestor Malet on 28/01/14.
//  Copyright (c) 2014 Storn.es. All rights reserved.
//

#import "MapViewController.h"

#import "ModalDataSource.h"
#import "Stage1DataSource.h"
#import "Stage2DataSource.h"
#import "StageGameDataSource.h"
#import "Stage3DataSource.h"
#import "Stage8DataSource.h"
#import "InformationDataSource.h"
#import "ModalViewController.h"

#import "LevelManager.h"
#import "StageManager.h"

#import "LevelSelectorViewController.h"

@interface MapViewController (){
    NSArray *stagesUnblocked;
    NSArray *stagesBlocked;
    NSArray *stagesButtons;
}

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
        stagesUnblocked = [[NSArray alloc] initWithObjects:@"nivell01", @"nivell02a", @"nivell03a", @"nivell04a", @"nivell05a", @"nivell06a", @"nivell07a", @"nivell08a", nil];
        stagesBlocked = [[NSArray alloc] initWithObjects:@"nivell01", @"nivell02b", @"nivell03b", @"nivell04b", @"nivell05b", @"nivell06b", @"nivell07b", @"nivell08b", nil];
    }
    return self;
}

#pragma mark - View life cycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    stagesButtons = [[NSArray alloc] initWithObjects:b_stage1, b_stage2, b_stage3, b_stage4, b_stage5, b_stage6, b_stage7, b_stage8, nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(closeModal:) name:NOT_BACK_TO_MAP object:nil];


    
    [self refreshStageStatus];
    
    if(DEBUG_APP){
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"App en debug" message:@"La app està en debug, estan totes les etapes desbloquejades" delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"Pues vale...",nil];
        [alert show];
    }
}

- (void)viewDidAppear:(BOOL)animated{
    
    if([[LevelManager sharedInstance] level] == nil){
        [self showLevelSelector:nil];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];

}


- (void) refreshStageStatus
{
    int currentStage = [[[StageManager sharedInstance] lastEndendStage] intValue];
    
    for (int i = 1; i <= 8; i++){
        UIButton *button = [stagesButtons objectAtIndex:i-1];
        NSString *imageName;
        if(i < (currentStage+2)){
            imageName = [stagesUnblocked objectAtIndex:i-1];
            [button setEnabled: (DEBUG_APP || YES)];
        }
        else{
            imageName = [stagesBlocked objectAtIndex:i-1];
            [button setEnabled: (DEBUG_APP || NO)];
        }
        
        [button setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
        [button setImage:[UIImage imageNamed:imageName] forState:UIControlStateHighlighted];
    }
}

- (void) presentStage:(id<ModalDataSource>)dataSource{
    ModalViewController *viewController = [[ModalViewController alloc] initWithDataSource:dataSource];
    [self presentViewController:viewController animated:YES completion: nil];
    
}


#pragma mark Actions
- (IBAction)showAbout:(id)sender{
    
    if(DEBUG_APP){
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Debug" message:@"Acabes d'esborrar tot, si us plau tanca l'app i torna a iniciar-la" delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"Ara la tanco...",nil];
        [alert show];
        [[LevelManager sharedInstance] reset];
        [[StageManager sharedInstance] reset];
    }
}

- (IBAction)showInformation:(id)sender{
    [self presentStage: [[InformationDataSource alloc] init]];
}

- (IBAction)showLevelSelector:(id)sender{
    LevelSelectorViewController *viewController = [[LevelSelectorViewController alloc] initWithNibName:@"LevelSelectorView" bundle:nil];
    [self presentViewController:viewController animated:YES completion: nil];
}

#pragma mark Actions stages
- (IBAction)stage1:(id)sender{
    [self presentStage: [[Stage1DataSource alloc] init]];
}

- (IBAction)stage2:(id)sender{
    [self presentStage: [[Stage2DataSource alloc] init]];
}

- (IBAction)stage3:(id)sender{
    [self presentStage: [[Stage3DataSource alloc] init]];
}

- (IBAction)stage4:(id)sender{
    StageGameDataSource *stage =[[StageGameDataSource alloc] init];
    stage.stage = 1;
    [self presentStage: stage];
}

- (IBAction)stage5:(id)sender{
    StageGameDataSource *stage =[[StageGameDataSource alloc] init];
    stage.stage = 2;
    [self presentStage: stage];
    
}

- (IBAction)stage6:(id)sender{
    StageGameDataSource *stage =[[StageGameDataSource alloc] init];
    stage.stage = 3;
    [self presentStage: stage];
    
}

- (IBAction)stage7:(id)sender{
    StageGameDataSource *stage =[[StageGameDataSource alloc] init];
    stage.stage = 4;
    [self presentStage: stage];
    
}

- (IBAction)stage8:(id)sender{
    [self presentStage: [[Stage8DataSource alloc] init]];
}

#pragma mark Notifications
- (void) closeModal:(NSNotification *)notification
{
    if (![self.presentedViewController isBeingDismissed]){
        [self.presentedViewController dismissViewControllerAnimated:YES completion:nil];
    }
    [self refreshStageStatus];
}


#pragma mark Orientation
- (NSUInteger) supportedInterfaceOrientations {
    return UIInterfaceOrientationMaskLandscape;
}

@end
