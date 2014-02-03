//
//  Stage3DataSource.m
//  AppMediterrania
//
//  Created by Nestor Malet on 02/02/14.
//  Copyright (c) 2014 Storn.es. All rights reserved.
//

#import "Stage3DataSource.h"
#import "Stage3ViewController.h"
#import "StageManager.h"
#import "LevelManager.h"

@interface Stage3DataSource (){
    NSMutableDictionary *backgrounds;
    int currentSubStage;
}

@end

@implementation Stage3DataSource
@synthesize viewController;

- (BOOL ) hasText{
    return NO;
}

- (void) initView{
    currentSubStage = 0;
    viewController = [[Stage3ViewController alloc] initWithNibName:@"Stage3View" bundle:nil];

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


    Stage3ViewController *stageViewController = (Stage3ViewController*) viewController;
    
    if(currentSubStage+1 < [arrayBackgrounds count]){
        currentSubStage++;
    }
    
    if(currentSubStage+1 == [arrayBackgrounds count]){
        [stageViewController nextButtonEnabled:YES];
        [stageViewController nextSubStageButtonEnabled:NO];

    }
    
    [stageViewController setBackground:[arrayBackgrounds objectAtIndex:currentSubStage]];
}

@end
