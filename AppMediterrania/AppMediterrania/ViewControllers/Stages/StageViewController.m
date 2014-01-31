//
//  StageViewController.m
//  AppMediterrania
//
//  Created by Nestor Malet on 30/01/14.
//  Copyright (c) 2014 Storn.es. All rights reserved.
//

#import "StageViewController.h"

@interface StageViewController ()

@end

@implementation StageViewController

- (id)initWithDataSource:(id<StageDataSource>)theDataSource
{
    self = [super initWithNibName:@"StageView" bundle:nil];
    if (self) {
        // Custom initialization
        self.dataSource = theDataSource;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.dataSource initView];
    
    UIViewController *stageViewController = [self.dataSource viewController];
    
    stageViewController.view.frame = self.self.stageView.bounds;
    
    [self.stageView addSubview:stageViewController.view];
    [stageViewController didMoveToParentViewController:self];
    [self addChildViewController:stageViewController];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)backMap:(id)sender{
    [[NSNotificationCenter defaultCenter] postNotificationName:BACK_TO_MAP object:self];
}


@end
