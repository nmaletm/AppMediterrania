//
//  GameManager.m
//  AppMediterrania
//
//  Created by Nestor Malet on 02/02/14.
//  Copyright (c) 2014 Storn.es. All rights reserved.
//

#import "GameManager.h"
#import "QuestionModel.h"

@implementation GameManager

#pragma mark - Shared instance creation

+ (GameManager *)sharedInstance
{
    static GameManager *instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [GameManager alloc];
        instance = [instance init];
    });
    
    return instance;
}

-(NSArray *)questionsAt:(int)level atStage:(int)stage{
    NSMutableArray *questions = [[NSMutableArray alloc] init];
    {
        QuestionModel *question = [[QuestionModel alloc] init];
        question.text = @"Pregunta 1 Rooster Crow About: Awesome sound of a rooster crowing early in the morning. great farming or alarm clock sound effects. Uploaded: 11.29.09";
        question.level = 1;
        question.stage = stage;
        question.subStage = 1;
        question.figuresCorrect = [[NSArray alloc] initWithObjects:  @"01_joc", @"02_joc", @"03_joc", nil];
        question.figuresIncorrect = [[NSArray alloc] initWithObjects:  @"04_joc", @"05_joc", @"06_joc", @"07_joc", @"08_joc", @"09_joc", nil];
        [questions addObject:question];
    }
    {
        QuestionModel *question = [[QuestionModel alloc] init];
        question.text = @"Pregunta 2 Rooster Crow About: Awesome sound of a rooster crowing early in the morning. great farming or alarm clock sound effects. Uploaded: 11.29.09";
        question.level = 1;
        question.stage = stage;
        question.subStage = 1;
        question.figuresCorrect = [[NSArray alloc] initWithObjects:  @"01_joc", @"02_joc", @"03_joc", nil];
        question.figuresIncorrect = [[NSArray alloc] initWithObjects:  @"04_joc", @"05_joc", @"06_joc", @"07_joc", @"08_joc", @"09_joc", nil];
        
        [questions addObject:question];
    }
    {
        QuestionModel *question = [[QuestionModel alloc] init];
        question.text = @"Pregunta 3 Rooster Crow About: Awesome sound of a rooster crowing early in the morning. great farming or alarm clock sound effects. Uploaded: 11.29.09";
        question.level = 1;
        question.stage = stage;
        question.subStage = 1;
        question.figuresCorrect = [[NSArray alloc] initWithObjects:  @"01_joc", @"02_joc", @"03_joc", nil];
        question.figuresIncorrect = [[NSArray alloc] initWithObjects:  @"04_joc", @"05_joc", @"06_joc", @"07_joc", @"08_joc", @"09_joc", nil];
        [questions addObject:question];
    }
    return questions;
}

@end
