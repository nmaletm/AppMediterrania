//
//  Stage3DataSource.m
//  AppMediterrania
//
//  Created by Nestor Malet on 02/02/14.
//  Copyright (c) 2014 Storn.es. All rights reserved.
//

#import "Stage3DataSource.h"
#import "Stage2ViewController.h"
#import "StageManager.h"
#import "LevelManager.h"

@interface Stage3DataSource (){
    NSMutableDictionary *backgrounds;
    int currentView;
}

@end

@implementation Stage3DataSource
@synthesize viewController;

- (BOOL ) hasText{
    return NO;
}

- (void) initView{
    currentView = 0;
    viewController = [[Stage2ViewController alloc] initWithNibName:@"Stage3View" bundle:nil];

    backgrounds = [[NSMutableDictionary alloc] init];
    NSArray *backgroundsEasy = [[NSArray alloc] initWithObjects:
                         @"piramide_mitja_1",
                         @"piramide_mitja_2",
                         nil];
    [backgrounds setObject:backgroundsEasy forKey:@"1"];
    
    NSArray *backgroundsMedium = [[NSArray alloc] initWithObjects:
                         @"pantalla_cuina_1",
                         @"piramide_mitja_2",
                         nil];
    [backgrounds setObject:backgroundsMedium forKey:@"2"];
    
    NSArray *backgroundsDifficult = [[NSArray alloc] initWithObjects:
                         @"piramide_mitja_1",
                         @"piramide_mitja_2",
                         nil];
    [backgrounds setObject:backgroundsDifficult forKey:@"3"];
}

- (NSString *) text{
    return nil;
}


- (UIViewController *) viewController{
    return viewController;
}

- (void) goNextSubLevel{
    NSArray *arrayBackgrounds = [backgrounds valueForKey:[[LevelManager sharedInstance] levelString]];
    
    Stage2ViewController *stageViewController = (Stage2ViewController*) viewController;
    
    if(currentView+1 >= [arrayBackgrounds count]){
        [stageViewController nextButtonEnabled:YES];
    }
    else{
        currentView++;
    }
    
    [stageViewController setBackground:[arrayBackgrounds objectAtIndex:currentView]];
}

@end
