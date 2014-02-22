//
//  Stage2DataSource.m
//  AppMediterrania
//
//  Created by Nestor Malet on 02/02/14.
//  Copyright (c) 2014 Storn.es. All rights reserved.
//

#import "Stage2DataSource.h"
#import "Stage2ViewController.h"
#import "StageManager.h"
#import "LevelManager.h"

@interface Stage2DataSource (){
    NSMutableDictionary *texts;
    NSMutableDictionary *backgrounds;
    int currentSubStage;
}

@end

@implementation Stage2DataSource
@synthesize viewController;

- (BOOL ) hasBackMapButton{
    return YES;
}

- (BOOL ) hasText{
    return YES;
}

- (BOOL ) hasNextButton{
    return YES;
}

- (void) initView{
    currentSubStage = 1;
    [[NSNotificationCenter defaultCenter] postNotificationName:NEXT_BUTTON_DISABLED object:self];

    viewController = [[Stage2ViewController alloc] initWithNibName:@"Stage2View" bundle:nil];
    
    backgrounds = [[NSMutableDictionary alloc] init];
    NSArray *backgroundEasy = [[NSArray alloc] initWithObjects:
                               @"cuina_niv01_1a",
                               @"cuina_niv01_1b",
                               @"cuina_niv01_2a",
                               @"cuina_niv01_2b",
                               @"cuina_niv01_3a",
                               @"cuina_niv01_3b",
                               @"cuina_niv01_4a",
                        //       @"cuina_niv01_4b",
                         nil];
    [backgrounds setObject:backgroundEasy forKey:@"1"];
    
    NSArray *backgroundMedium = [[NSArray alloc] initWithObjects:
                                 @"cuina_niv02_1a",
                                 @"cuina_niv02_1b",
                                 @"cuina_niv02_2a",
                                 @"cuina_niv02_2b",
                                 @"cuina_niv02_3a",
                                 @"cuina_niv02_3b",
                                 @"cuina_niv02_4a",
                       //          @"cuina_niv02_4b",
                           nil];
    [backgrounds setObject:backgroundMedium forKey:@"2"];
    
    NSArray *backgroundDificult = [[NSArray alloc] initWithObjects:
                                   @"cuina_niv03_1a",
                                   @"cuina_niv03_1b",
                                   @"cuina_niv03_2a",
                                   @"cuina_niv03_2b",
                                   @"cuina_niv03_3a",
                           //        @"cuina_niv03_3b",
                             nil];
    [backgrounds setObject:backgroundDificult forKey:@"3"];
    

    texts = [[NSMutableDictionary alloc] init];
    NSArray *textEasy = [[NSArray alloc] initWithObjects:
                         @"Antes de empezar a cocinar nuestros platos dieta mediterránea, es muy importante saber qué alimentos precisamos y cómo los conservaremos.",
                         @"Antes de empezar a cocinar nuestros platos dieta mediterránea, es muy importante saber qué alimentos precisamos y cómo los conservaremos.",
                         @"Antes de empezar a cocinar nuestros platos dieta mediterránea, es muy importante saber qué alimentos precisamos y cómo los conservaremos.",
                         @"Antes de empezar a cocinar nuestros platos dieta mediterránea, es muy importante saber qué alimentos precisamos y cómo los conservaremos.",
                         @"Antes de empezar a cocinar nuestros platos dieta mediterránea, es muy importante saber qué alimentos precisamos y cómo los conservaremos.",
                         @"Antes de empezar a cocinar nuestros platos dieta mediterránea, es muy importante saber qué alimentos precisamos y cómo los conservaremos.",
                         @"Antes de empezar a cocinar nuestros platos dieta mediterránea, es muy importante saber qué alimentos precisamos y cómo los conservaremos.",
                         @"Antes de empezar a cocinar nuestros platos dieta mediterránea, es muy importante saber qué alimentos precisamos y cómo los conservaremos.",
                         nil];
    [texts setObject:textEasy forKey:@"1"];
    
    NSArray *textMedium = [[NSArray alloc] initWithObjects:
                           @"Antes de empezar a cocinar nuestros platos dieta mediterránea, es muy importante saber qué alimentos precisamos y cómo los conservaremos.",
                           @"Antes de empezar a cocinar nuestros platos dieta mediterránea, es muy importante saber qué alimentos precisamos y cómo los conservaremos.",
                           @"Antes de empezar a cocinar nuestros platos dieta mediterránea, es muy importante saber qué alimentos precisamos y cómo los conservaremos.",
                           @"Antes de empezar a cocinar nuestros platos dieta mediterránea, es muy importante saber qué alimentos precisamos y cómo los conservaremos.",
                           @"Antes de empezar a cocinar nuestros platos dieta mediterránea, es muy importante saber qué alimentos precisamos y cómo los conservaremos.",
                           @"Antes de empezar a cocinar nuestros platos dieta mediterránea, es muy importante saber qué alimentos precisamos y cómo los conservaremos.",
                           @"Antes de empezar a cocinar nuestros platos dieta mediterránea, es muy importante saber qué alimentos precisamos y cómo los conservaremos.",
                           @"Antes de empezar a cocinar nuestros platos dieta mediterránea, es muy importante saber qué alimentos precisamos y cómo los conservaremos.",
                           nil];
    [texts setObject:textMedium forKey:@"2"];
    
    NSArray *textDificult = [[NSArray alloc] initWithObjects:
                             @"Antes de empezar a cocinar nuestros platos dieta mediterránea, es muy importante saber qué alimentos precisamos y cómo los conservaremos.",
                             @"Antes de empezar a cocinar nuestros platos dieta mediterránea, es muy importante saber qué alimentos precisamos y cómo los conservaremos.",
                             @"Antes de empezar a cocinar nuestros platos dieta mediterránea, es muy importante saber qué alimentos precisamos y cómo los conservaremos.",
                             @"Antes de empezar a cocinar nuestros platos dieta mediterránea, es muy importante saber qué alimentos precisamos y cómo los conservaremos.",
                             @"Antes de empezar a cocinar nuestros platos dieta mediterránea, es muy importante saber qué alimentos precisamos y cómo los conservaremos.",
                             @"Antes de empezar a cocinar nuestros platos dieta mediterránea, es muy importante saber qué alimentos precisamos y cómo los conservaremos.",
                             nil];
    [texts setObject:textDificult forKey:@"3"];

}

- (void) willLoad{
    Stage2ViewController *stageViewController = (Stage2ViewController*) viewController;
    NSArray *backgroundsLevel = [backgrounds objectForKey:[[LevelManager sharedInstance] levelString]];
    [stageViewController setBackground:[backgroundsLevel objectAtIndex:currentSubStage-1]];
}

- (NSString *) text{
    return [[texts objectForKey:[[LevelManager sharedInstance] levelString]] objectAtIndex:currentSubStage-1];
}


- (UIViewController *) viewController{
    return viewController;
}

- (void) goNextSubLevel{
    Stage2ViewController *stageViewController = (Stage2ViewController*) viewController;
    NSArray *backgroundsLevel = [backgrounds objectForKey:[[LevelManager sharedInstance] levelString]];
    
    if(currentSubStage >= [backgroundsLevel count]){

        [[StageManager sharedInstance] markAsCompleted: 2];
        [[NSNotificationCenter defaultCenter] postNotificationName:NOT_BACK_TO_MAP object:self];
    }
    else{
        currentSubStage++;
        if(currentSubStage == [backgroundsLevel count]){
            [[NSNotificationCenter defaultCenter] postNotificationName:NEXT_BUTTON_ENABLED object:self];
            [stageViewController nextSubStageButtonEnabled:NO];
        }
    }
    
    NSString *background = [backgroundsLevel objectAtIndex:currentSubStage-1];
    [stageViewController setBackground:background];
}

@end
