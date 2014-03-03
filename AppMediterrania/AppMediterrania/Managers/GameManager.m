//
//  GameManager.m
//  AppMediterrania
//
//  Created by Nestor Malet on 02/02/14.
//  Copyright (c) 2014 Storn.es. All rights reserved.
//

#import "GameManager.h"
#import "QuestionModel.h"
#import "RXMLElement.h"


@interface GameManager (){
    RXMLElement *rootGameData;
}

@end

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

- (id) init{
    id instance = [super init];
    rootGameData = [RXMLElement elementFromXMLFile:@"Questions.xml"];

    return instance;
}

-(NSArray *)questionsAt:(int)level atStage:(int)stage{
    
    NSMutableArray *questions = [[NSMutableArray alloc] init];
    
    NSString *path = [NSString stringWithFormat:@"//juego/pregunta[dificultad='%d' and actividad='%d']",level,stage];
    
    [rootGameData iterateWithRootXPath:path usingBlock: ^(RXMLElement *data) {
        
        QuestionModel *question = [[QuestionModel alloc] init];
        question.text = [[data child:@"texto"] text];
        
        
        NSArray *validFigures = [data children:@"correcta"];
        NSMutableArray * validMutableArray = [[NSMutableArray alloc] init];
        for (RXMLElement *object in validFigures) {
            NSString *name = [NSString stringWithFormat:@"%@_joc",[object text]];
            [validMutableArray addObject:name];
        }
        
        NSArray *invalidFigures = [data children:@"incorrecta"];
        NSMutableArray *invalidMutableArray = [[NSMutableArray alloc] init];
        for (RXMLElement *object in invalidFigures) {
            NSString *name = [NSString stringWithFormat:@"%@_joc",[object text]];
            [invalidMutableArray addObject:name];
        }
        
        question.figuresCorrect = [NSArray arrayWithArray:validMutableArray];
        question.figuresIncorrect = [NSArray arrayWithArray:invalidMutableArray];

        [questions addObject:question];
    }];
    
    return questions;
}

/*
 Parser pel format del xml de Question2.xml
-(NSArray *)questionsAt:(int)level atStage:(int)stage{
    
    NSMutableArray *questions = [[NSMutableArray alloc] init];
    
    NSString *path = [NSString stringWithFormat:@"//game/stage[@value='%d']/level[@value='%d']/question",stage,level];
    
    [rootGameData iterateWithRootXPath:path usingBlock: ^(RXMLElement *data) {
        
        QuestionModel *question = [[QuestionModel alloc] init];
        question.text = [[data child:@"text"] text];
        
        
        RXMLElement *validFigures = [data child:@"valid"];
        NSMutableArray * validMutableArray = [[NSMutableArray alloc] init];
        for (RXMLElement *object in [validFigures children:@"figure"]) {
            NSString *name = [NSString stringWithFormat:@"%@_joc",[object attribute:@"id"]];
            [validMutableArray addObject:name];
        }
        
        RXMLElement *invalidFigures = [data child:@"invalid"];
        NSMutableArray *invalidMutableArray = [[NSMutableArray alloc] init];
        for (RXMLElement *object in [invalidFigures children:@"figure"]) {
            NSString *name = [NSString stringWithFormat:@"%@_joc",[object attribute:@"id"]];
            [invalidMutableArray addObject:name];
        }
        
        question.figuresCorrect = [NSArray arrayWithArray:validMutableArray];
        question.figuresIncorrect = [NSArray arrayWithArray:invalidMutableArray];
        
        [questions addObject:question];
    }];
    
    return questions;
}
*/

@end
