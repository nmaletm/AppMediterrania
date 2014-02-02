//
//  Stage1DataSource.m
//  AppMediterrania
//
//  Created by Nestor Malet on 31/01/14.
//  Copyright (c) 2014 Storn.es. All rights reserved.
//

#import "Stage1DataSource.h"
#import "Stage1TreeViewController.h"
#import "Stage1BasketViewController.h"
#import "Stage1FieldViewController.h"
#import "Stage1FarmViewController.h"
#import "Stage1FishingViewController.h"

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
             [[Stage1TreeViewController alloc] initWithNibName:@"Stage1TreeView" bundle:nil],
             [[Stage1BasketViewController alloc] initWithNibName:@"Stage1BasketView" bundle:nil],
             [[Stage1FieldViewController alloc] initWithNibName:@"Stage1FieldView" bundle:nil],
             [[Stage1FarmViewController alloc] initWithNibName:@"Stage1FarmView" bundle:nil],
             [[Stage1FishingViewController alloc] initWithNibName:@"Stage1FishingView" bundle:nil],
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
