//
//  StageGameDataSource.m
//  AppMediterrania
//
//  Created by Nestor Malet on 02/02/14.
//  Copyright (c) 2014 Storn.es. All rights reserved.
//

#import "StageGameDataSource.h"
#import "QuestionModel.h"

#import "StageGameViewController.h"
#import "StageGameIntroViewController.h"
#import "StageManager.h"
#import "LevelManager.h"
#import "GameManager.h"

@interface StageGameDataSource (){
    NSMutableDictionary *backgrounds;
    int currentSubStage;
    NSArray *questions;
}

@end

@implementation StageGameDataSource
@synthesize viewController;
@synthesize stage;

- (BOOL ) hasText{
    return NO;
}

- (BOOL ) hasNextButton{
    return YES;
}

- (void) initView{
    currentSubStage = 0;
    
    int level = [[[LevelManager sharedInstance] level] intValue];
    questions = [[GameManager sharedInstance] questionsAt:level atStage:self.stage];

    if(self.stage == 1){
        viewController = [[StageGameIntroViewController alloc] initWithNibName:@"StageGameIntroView" bundle:nil];
        currentSubStage = -1;
    }
    else{
        [self initViewControllerGame];
    }
    
}

- (NSString *) text{
    return nil;
}


- (UIViewController *) viewController{
    return viewController;
}

- (void) goNextSubLevel{
    
    if(currentSubStage == -1){
        [self initViewControllerGame];
        return;
    }
    
    StageGameViewController *stageViewController = (StageGameViewController*) viewController;
    
    if(currentSubStage+1 < [questions count]){
        currentSubStage++;
        [stageViewController changeQuestion:[questions objectAtIndex:currentSubStage]];
    }
    else{
        [[StageManager sharedInstance] markAsCompleted: self.stage+3];
        [[NSNotificationCenter defaultCenter] postNotificationName:NOT_BACK_TO_MAP object:self];
    }
  
}

- (void) initViewControllerGame{
    currentSubStage = 0;
    viewController = [[StageGameViewController alloc] initWithNibName:@"StageGameView" bundle:nil question:[questions objectAtIndex:currentSubStage]];
}

@end