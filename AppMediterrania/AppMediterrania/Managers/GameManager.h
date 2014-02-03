//
//  GameManager.h
//  AppMediterrania
//
//  Created by Nestor Malet on 02/02/14.
//  Copyright (c) 2014 Storn.es. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GameManager : NSObject

+ (GameManager *)sharedInstance;

-(NSArray *)questionsAt:(int)level atStage:(int)stage;


@end
