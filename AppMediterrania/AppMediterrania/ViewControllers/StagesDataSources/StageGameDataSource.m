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
#import "StageManager.h"
#import "LevelManager.h"

@interface StageGameDataSource (){
    NSMutableDictionary *backgrounds;
    int currentSubStage;
}

@end

@implementation StageGameDataSource
@synthesize viewController;
@synthesize stage;

- (BOOL ) hasText{
    return NO;
}

- (void) initView{
    currentSubStage = 0;
    
    QuestionModel *question = [[QuestionModel alloc] init];
    question.text = @"Rooster Crow About: Awesome sound of a rooster crowing early in the morning. great farming or alarm clock sound effects. Uploaded: 11.29.09";
    question.level = 1;
    question.stage = self.stage;
    question.subStage = 1;
    question.figuresCorrect = [[NSArray alloc] initWithObjects:  @"stage", @"stage1", nil];
    question.figuresIncorrect = [[NSArray alloc] initWithObjects:  @"lock", @"lock", @"lock", @"lock", @"lock", @"lock", @"lock", nil];
    
    viewController = [[StageGameViewController alloc] initWithNibName:@"StageGameView" bundle:nil question:question];
    
    
}

- (NSString *) text{
    return nil;
}


- (UIViewController *) viewController{
    return viewController;
}

- (void) goNextSubLevel{
    /*
    NSArray *arrayBackgrounds = [backgrounds valueForKey:[[LevelManager sharedInstance] levelString]];
    
    Stage2ViewController *stageViewController = (Stage2ViewController*) viewController;
    
    if(currentSubStage+1 >= [arrayBackgrounds count]){
        [stageViewController nextButtonEnabled:YES];
    }
    else{
        currentSubStage++;
    }
    
    [stageViewController setBackground:[arrayBackgrounds objectAtIndex:currentSubStage]];
    */
}

@end