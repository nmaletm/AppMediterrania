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
    NSArray *backgrounds;
    int currentSubStage;
    BOOL nextEnabled;
}

@end

@implementation Stage2DataSource
@synthesize viewController;

- (BOOL ) hasText{
    return YES;
}

- (BOOL ) hasNextButton{
    return YES;
}

- (void) initView{
    currentSubStage = 0;
    nextEnabled = NO;
    [[NSNotificationCenter defaultCenter] postNotificationName:NEXT_BUTTON_DISABLED object:self];

    viewController = [[Stage2ViewController alloc] initWithNibName:@"Stage2View" bundle:nil];
    backgrounds = [[NSArray alloc] initWithObjects:
                   @"pantalla_cuina",
                   @"pantalla_cuina_1",
                  @"pantalla_cuina_2",
                  @"pantalla_cuina_3",
                  nil];

    texts = [[NSMutableDictionary alloc] init];
    NSArray *textEasy = [[NSArray alloc] initWithObjects:
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
                           nil];
    [texts setObject:textMedium forKey:@"2"];
    
    NSArray *textDificult = [[NSArray alloc] initWithObjects:
                             @"Antes de empezar a cocinar nuestros platos dieta mediterránea, es muy importante saber qué alimentos precisamos y cómo los conservaremos.",
                             @"Antes de empezar a cocinar nuestros platos dieta mediterránea, es muy importante saber qué alimentos precisamos y cómo los conservaremos.",
                             @"Antes de empezar a cocinar nuestros platos dieta mediterránea, es muy importante saber qué alimentos precisamos y cómo los conservaremos.",
                             @"Antes de empezar a cocinar nuestros platos dieta mediterránea, es muy importante saber qué alimentos precisamos y cómo los conservaremos.",
                             @"Antes de empezar a cocinar nuestros platos dieta mediterránea, es muy importante saber qué alimentos precisamos y cómo los conservaremos.",
                             nil];
    [texts setObject:textDificult forKey:@"3"];
    
}

- (NSString *) text{
    return [[texts objectForKey:[[LevelManager sharedInstance] levelString]] objectAtIndex:currentSubStage];
}


- (UIViewController *) viewController{
    return viewController;
}

- (void) goNextSubLevel{
    Stage2ViewController *stageViewController = (Stage2ViewController*) viewController;
    
    if(currentSubStage+1 >= [backgrounds count]){
        if(!nextEnabled){
            [[NSNotificationCenter defaultCenter] postNotificationName:NEXT_BUTTON_ENABLED object:self];
            nextEnabled = YES;
            [stageViewController nextSubStageButtonEnabled:NO];
        }
        else{
            [[StageManager sharedInstance] markAsCompleted: 2];
        
            [[NSNotificationCenter defaultCenter] postNotificationName:NOT_BACK_TO_MAP object:self];
        }
    }
    else{
        currentSubStage++;
        [[NSNotificationCenter defaultCenter] postNotificationName:NEXT_BUTTON_DISABLED object:self];
    }
    
    [stageViewController setBackground:[backgrounds objectAtIndex:currentSubStage]];
}

@end
