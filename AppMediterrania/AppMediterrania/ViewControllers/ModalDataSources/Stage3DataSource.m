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

- (BOOL ) hasBackMapButton{
    return YES;
}

- (BOOL ) hasText{
    NSArray *arrayBackgrounds = [backgrounds valueForKey:[[LevelManager sharedInstance] levelString]];
    return (currentSubStage <= [arrayBackgrounds count]);
}

- (BOOL ) hasNextButton{
    return YES;
}

- (void) initView{
    currentSubStage = 1;
    viewController = [[Stage3ViewController alloc] initWithNibName:@"Stage3View" bundle:nil];

    backgrounds = [[NSMutableDictionary alloc] init];
    NSArray *backgroundsEasy = [[NSArray alloc] initWithObjects:
                                @"pantalla_piramide_nivell01a",
                                @"pantalla_piramide_nivell01",
                                nil];
    [backgrounds setObject:backgroundsEasy forKey:@"1"];
    
    
    NSArray *backgroundsMedium = [[NSArray alloc] initWithObjects:
                                  @"pantalla_plat_nivell02a",
                                  @"pantalla_plat_nivell02b",
                                  @"pantalla_plat_nivell02c",
                                  @"pantalla_plat_nivell02d",
                                  @"pantalla_plat_nivell02",
                                  nil];
    [backgrounds setObject:backgroundsMedium forKey:@"2"];
    
    
    NSArray *backgroundsDifficult = [[NSArray alloc] initWithObjects:
                                     @"pantalla_piramide_nivell03a",
                                     @"pantalla_piramide_nivell03",
                                     nil];
    [backgrounds setObject:backgroundsDifficult forKey:@"3"];

}

- (void) willLoad{
    NSArray *arrayBackgrounds = [backgrounds valueForKey:[[LevelManager sharedInstance] levelString]];
    if(currentSubStage <= [arrayBackgrounds count]){
        Stage3ViewController *stageViewController = (Stage3ViewController*) viewController;
        [stageViewController setBackground:[arrayBackgrounds objectAtIndex: currentSubStage-1]];
        
        if([arrayBackgrounds count] == currentSubStage){
            [[NSNotificationCenter defaultCenter] postNotificationName:NEXT_BUTTON_ENABLED object:self];
        }
        else{
            [[NSNotificationCenter defaultCenter] postNotificationName:NEXT_BUTTON_DISABLED object:self];
        }
    }
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
        
        if(currentSubStage == [arrayBackgrounds count]){
            Stage3ViewController *stageViewController = (Stage3ViewController*) viewController;
            [stageViewController nextSubStageButtonEnabled:NO];
        }
    }
    else {
        viewController = [[Stage3ConclusionViewController alloc] initWithNibName:@"Stage3ConclusionView" bundle:nil];
    }
}

@end
