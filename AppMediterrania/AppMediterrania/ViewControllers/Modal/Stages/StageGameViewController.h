//
//  StageGameViewController.h
//  AppMediterrania
//
//  Created by Nestor Malet on 02/02/14.
//  Copyright (c) 2014 Storn.es. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "QuestionModel.h"

@interface StageGameViewController : UIViewController

@property (strong, nonatomic) IBOutlet UITextView *questionTextView;
@property (strong, nonatomic) IBOutlet UILabel *scoreLabel;

@property (strong, nonatomic) IBOutlet UIButton *button_11;
@property (strong, nonatomic) IBOutlet UIButton *button_12;
@property (strong, nonatomic) IBOutlet UIButton *button_13;
@property (strong, nonatomic) IBOutlet UIButton *button_21;
@property (strong, nonatomic) IBOutlet UIButton *button_22;
@property (strong, nonatomic) IBOutlet UIButton *button_23;
@property (strong, nonatomic) IBOutlet UIButton *button_31;
@property (strong, nonatomic) IBOutlet UIButton *button_32;
@property (strong, nonatomic) IBOutlet UIButton *button_33;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil question:(QuestionModel *)theQuestion;

- (IBAction)figureButton:(id)sender;

- (void)changeQuestion:(QuestionModel *)theQuestion;

@end
