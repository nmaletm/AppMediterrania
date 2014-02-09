//
//  StageGameViewController.m
//  AppMediterrania
//
//  Created by Nestor Malet on 02/02/14.
//  Copyright (c) 2014 Storn.es. All rights reserved.
//

#import "StageGameViewController.h"
#import "StageManager.h"

#import "NSMutableArray_Shuffling.h"

@interface StageGameViewController (){
    QuestionModel *question;
    NSMutableArray *correctSelected;
    NSMutableArray *dashboardFigures;
    NSArray *dashboardButtons;
}

@end

@implementation StageGameViewController
@synthesize nextButton;
@synthesize scoreLabel;
@synthesize questionTextView;
@synthesize button_11;
@synthesize button_12;
@synthesize button_13;
@synthesize button_21;
@synthesize button_22;
@synthesize button_23;
@synthesize button_31;
@synthesize button_32;
@synthesize button_33;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil question:(QuestionModel *)theQuestion
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        question = theQuestion;
    }
    return self;
}

- (void)changeQuestion:(QuestionModel *)theQuestion{
    question = theQuestion;
    [self reStartGameButtons];
    [self initGame];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    dashboardButtons = [[NSArray alloc] initWithObjects: button_11, button_12, button_13,
                                                        button_21, button_22, button_23,
                                                        button_31, button_32, button_33, nil];
    
    [self initGame];
}

- (void) initGame{
    correctSelected = [[NSMutableArray alloc] init];
    [nextButton setEnabled: NO];
    
    dashboardFigures = [[NSMutableArray alloc] init];
    [dashboardFigures addObjectsFromArray:question.figuresCorrect];
    [dashboardFigures addObjectsFromArray:question.figuresIncorrect];
    [dashboardFigures shuffle];
    
    
    [nextButton setEnabled: NO];
    [questionTextView setText:question.text];
    [self refreshScore];
    [self refreshButtons];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    
}

#pragma mark - Actions

- (IBAction)figureButton:(id)sender{
    UIButton *button = (UIButton *) sender;
    int selected = button.tag;
    
    if([question.figuresCorrect containsObject:[dashboardFigures objectAtIndex:selected]]){
        [correctSelected addObject:[NSNumber numberWithInt:selected]];
        [self checkEndGame];
    }
    
    [self refreshScore];
    [self refreshButtons];
}


- (IBAction)nextButton:(id)sender{
    [[NSNotificationCenter defaultCenter] postNotificationName:NOT_NEXT_SUB_LEVEL object:self];
}

#pragma mark - Screen

- (void) refreshScore{
    [scoreLabel setText:[NSString stringWithFormat:@"%lu/%lu", (unsigned long)[correctSelected count], (unsigned long)[question.figuresCorrect count]]];
}

- (void) refreshButtons{
    for(int i = 0; i < 9; i++){
        NSString *figure = [dashboardFigures objectAtIndex:i];
        UIButton *button = [dashboardButtons objectAtIndex:i];
        
        button.tag = i;
        
        if([correctSelected containsObject:[NSNumber numberWithInt: i]]){
            figure = [NSString stringWithFormat:@"%@_b", figure];
            [button setEnabled:NO];
        }
        
        [button setImage:[UIImage imageNamed:figure] forState:UIControlStateNormal];
        [button setImage:[UIImage imageNamed:figure] forState:UIControlStateHighlighted];
    }
}


- (void) checkEndGame{
    if([correctSelected count] >= [question.figuresCorrect count]){
        [UIView beginAnimations:nil context:NULL];
        [UIView setAnimationDuration:1];
        
        for(int i = 0; i < 9; i++){
            UIButton *button = [dashboardButtons objectAtIndex:i];
            
            if(![correctSelected containsObject:[NSNumber numberWithInt: i]]){
                [button setAlpha:0];
            }
        }
        [UIView commitAnimations];
        [nextButton setEnabled:YES];
    }
}

- (void) reStartGameButtons{
    
    for(int i = 0; i < 9; i++){
        UIButton *button = [dashboardButtons objectAtIndex:i];
        [button setAlpha:1];
        [button setEnabled:YES];
    }
}

@end