//
//  StageViewController.m
//  AppMediterrania
//
//  Created by Nestor Malet on 30/01/14.
//  Copyright (c) 2014 Storn.es. All rights reserved.
//

#import "ModalViewController.h"

@interface ModalViewController ()

@end

@implementation ModalViewController
@synthesize informationTextView;
@synthesize informationView;

- (id)initWithDataSource:(id<ModalDataSource>)theDataSource
{
    self = [super initWithNibName:@"ModalView" bundle:nil];
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
    
    [self loadViewController];
}

- (void) loadViewController{
    UIViewController *stageViewController = [self.dataSource viewController];
    
    stageViewController.view.frame = self.self.stageView.bounds;
    
    [self.stageView addSubview:stageViewController.view];
    [stageViewController didMoveToParentViewController:self];
    [self addChildViewController:stageViewController];
    
    [informationView setHidden: ![self.dataSource hasText]];
    [informationTextView setText: [self.dataSource text]];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark - Actions

- (IBAction)backMap:(id)sender{
    [[NSNotificationCenter defaultCenter] postNotificationName:NOT_BACK_TO_MAP object:self];
}


#pragma mark - Notifications
- (IBAction)nextButton:(id)sender{
    [[NSNotificationCenter defaultCenter] postNotificationName:NOT_NEXT_SUB_LEVEL object:self];

    if([self.dataSource respondsToSelector:@selector(goNextSubLevel)]){
        [self.dataSource goNextSubLevel];
        [self loadViewController];
    }
}


#pragma mark Orientation
- (NSUInteger) supportedInterfaceOrientations {
    return UIInterfaceOrientationMaskLandscape;
}

@end
