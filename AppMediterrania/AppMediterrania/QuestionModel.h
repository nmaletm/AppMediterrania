//
//  QuestionModel.h
//  AppMediterrania
//
//  Created by Nestor Malet on 02/02/14.
//  Copyright (c) 2014 Storn.es. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface QuestionModel : NSObject

@property (strong, nonatomic) NSString *text;
@property (strong, nonatomic) NSArray *figuresCorrect;
@property (strong, nonatomic) NSArray *figuresIncorrect;

@property (atomic) int level;
@property (atomic) int stage;
@property (atomic) int subStage;

@end
