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
#import "StageManager.h"

@implementation Stage8DataSource{
    BOOL hasNextButton;
}
@synthesize viewController;

- (BOOL ) hasText{
    return NO;
}

- (BOOL ) hasNextButton{
    return hasNextButton;
}

- (NSString *) text{
    return nil;
}

- (void) initView{
    hasNextButton = YES;
    viewController = [[Stage8IntroViewController alloc] initWithNibName:@"Stage8IntroView" bundle:nil];
}

- (void) goNextSubLevel{
    hasNextButton = NO;
    viewController = [[Stage8ViewController alloc] initWithNibName:@"Stage8View" bundle:nil];
    [[StageManager sharedInstance] markAsCompleted: 8];
}

@end
