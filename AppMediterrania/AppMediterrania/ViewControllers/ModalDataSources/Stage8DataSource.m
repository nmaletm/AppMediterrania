//
//  Stage8DataSource.m
//  AppMediterrania
//
//  Created by Nestor Malet on 31/01/14.
//  Copyright (c) 2014 Storn.es. All rights reserved.
//

#import "Stage8DataSource.h"
#import "Stage8IntroViewController.h"
#import "Stage8ViewController.h"
#import "Stage8EndViewController.h"
#import "StageManager.h"

@implementation Stage8DataSource{
    int currentSubStage;
    NSArray *views;
}
@synthesize viewController;

- (BOOL ) hasBackMapButton{
    return currentSubStage < [views count];
}

- (BOOL ) hasText{
    return NO;
}

- (BOOL ) hasNextButton{
    return currentSubStage < [views count];
}

- (NSString *) text{
    return nil;
}

- (UIViewController *) viewController{
    viewController = [views objectAtIndex: currentSubStage-1];
    return viewController;
}

- (void) initView{
    currentSubStage = 1;
    
    views = [[NSArray alloc] initWithObjects:
             [[Stage8IntroViewController alloc] initWithNibName:@"Stage8IntroView" bundle:nil],
             [[Stage8ViewController alloc] initWithNibName:@"Stage8View" bundle:nil background:@"recepta_01a" hasBackButton: NO],
             [[Stage8ViewController alloc] initWithNibName:@"Stage8View" bundle:nil background:@"recepta_01b" hasBackButton: YES],
             [[Stage8ViewController alloc] initWithNibName:@"Stage8View" bundle:nil background:@"recepta_02a" hasBackButton: YES],
             [[Stage8ViewController alloc] initWithNibName:@"Stage8View" bundle:nil background:@"recepta_02b" hasBackButton: YES],
             [[Stage8ViewController alloc] initWithNibName:@"Stage8View" bundle:nil background:@"recepta_03a" hasBackButton: YES],
             [[Stage8ViewController alloc] initWithNibName:@"Stage8View" bundle:nil background:@"recepta_03b" hasBackButton: YES],
             [[Stage8EndViewController alloc] initWithNibName:@"Stage8EndView" bundle:nil],
             nil];
}

- (void) goNextSubLevel{
    if(currentSubStage < [views count]){
        currentSubStage++;
    }
    
    if(currentSubStage == [views count]-1){
        [[StageManager sharedInstance] markAsCompleted: 8];
    }
    
}

- (void) goPreviousSubLevel{
    if(currentSubStage > 0){
        currentSubStage--;
    }
}

@end
