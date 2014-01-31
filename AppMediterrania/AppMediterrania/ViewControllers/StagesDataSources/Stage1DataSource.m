//
//  Stage1DataSource.m
//  AppMediterrania
//
//  Created by Nestor Malet on 31/01/14.
//  Copyright (c) 2014 Storn.es. All rights reserved.
//

#import "Stage1DataSource.h"
#import "Stage1Sub1ViewController.h"
#import "Stage1Sub2ViewController.h"
#import "Stage1Sub3ViewController.h"
#import "Stage1Sub4ViewController.h"
#import "Stage1Sub5ViewController.h"

@interface Stage1DataSource (){
    NSArray *views;
    int currentView;
}

@end

@implementation Stage1DataSource
@synthesize viewController;

- (BOOL *) hasText{
    return NO;
}

- (void) initView{
    currentView = 0;
    views = [[NSArray alloc] initWithObjects:
             [[Stage1Sub1ViewController alloc] initWithNibName:@"Stage1Sub1View" bundle:nil],
             [[Stage1Sub2ViewController alloc] initWithNibName:@"Stage1Sub2View" bundle:nil],
             [[Stage1Sub3ViewController alloc] initWithNibName:@"Stage1Sub3View" bundle:nil],
             [[Stage1Sub4ViewController alloc] initWithNibName:@"Stage1Sub4View" bundle:nil],
             [[Stage1Sub5ViewController alloc] initWithNibName:@"Stage1Sub5View" bundle:nil],
             nil];

    viewController = [views objectAtIndex: currentView];
}

- (UIViewController *) viewController{
    viewController = [views objectAtIndex: currentView];
    return viewController;
}

- (void) goNextSubLevel{
    currentView++;
}

@end
