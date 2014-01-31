//
//  MapViewController.m
//  AppMediterrania
//
//  Created by Nestor Malet on 28/01/14.
//  Copyright (c) 2014 Storn.es. All rights reserved.
//

#import "MapViewController.h"

#import "StageDataSource.h"
#import "Stage8DataSource.h"
#import "StageViewController.h"

#import "LevelManager.h"
#import "StageManager.h"

#import "LevelSelectorViewController.h"

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

#pragma mark - View life cycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(closeModal:) name:BACK_TO_MAP object:nil];


    
    [self refreshStageStatus];
}

- (void)viewDidAppear:(BOOL)animated{
    if([[LevelManager sharedInstance] level] == nil){
        [self showLevelSelector:nil];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void) refreshStageStatus{
    NSNumber *currentStage = [[StageManager sharedInstance] lastEndendStage];
}

- (void) presentStage:(id<StageDataSource>)dataSource{
    StageViewController *viewController = [[StageViewController alloc] initWithDataSource:dataSource];
    [self presentViewController:viewController animated:YES completion: nil];
    
}


#pragma mark Actions

- (IBAction)showInformation:(id)sender{
    
}

- (IBAction)showLevelSelector:(id)sender{
    LevelSelectorViewController *viewController = [[LevelSelectorViewController alloc] initWithNibName:@"LevelSelectorView" bundle:nil];
    [self presentViewController:viewController animated:YES completion: nil];
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
    id<StageDataSource> dataSource = [[Stage8DataSource alloc] init];
    [self presentStage: dataSource];
}

#pragma mark Notifications
- (void) closeModal:(NSNotification *)notification
{
    if (![self.presentedViewController isBeingDismissed]){
        [self.presentedViewController dismissViewControllerAnimated:YES completion:nil];
    }
}

@end
