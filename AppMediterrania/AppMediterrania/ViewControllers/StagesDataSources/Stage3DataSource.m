//
//  Stage3DataSource.m
//  AppMediterrania
//
//  Created by Nestor Malet on 02/02/14.
//  Copyright (c) 2014 Storn.es. All rights reserved.
//

#import "Stage3DataSource.h"
#import "Stage3ViewController.h"
#import "Stage3ConclusionViewController.h"
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
    NSArray *arrayBackgrounds = [backgrounds valueForKey:[[LevelManager sharedInstance] levelString]];
    return (currentSubStage-1 <= [arrayBackgrounds count]);
}

- (void) initView{
    currentSubStage = 1;
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
    return @"Para practicar una correcta alimentación dieta mediterránea debes seguir las medidas y raciones que te aconsejamos en la siguiente imagen:";
}


- (void) goNextSubLevel{
    NSArray *arrayBackgrounds = [backgrounds valueForKey:[[LevelManager sharedInstance] levelString]];

    currentSubStage++;
    
    if(currentSubStage <= [arrayBackgrounds count]){
        Stage3ViewController *stageViewController = (Stage3ViewController*) viewController;
        [stageViewController setBackground:[arrayBackgrounds objectAtIndex: currentSubStage-1]];
    }
    else if(currentSubStage == [arrayBackgrounds count] + 1){
        Stage3ViewController *stageViewController = (Stage3ViewController*) viewController;
        [stageViewController nextButtonEnabled:YES];
        [stageViewController nextSubStageButtonEnabled:NO];
    }
    else {
        viewController = [[Stage3ConclusionViewController alloc] initWithNibName:@"Stage3ConclusionView" bundle:nil];
    }
}

@end
