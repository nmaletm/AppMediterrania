//
//  GameManager.m
//  AppMediterrania
//
//  Created by Nestor Malet on 02/02/14.
//  Copyright (c) 2014 Storn.es. All rights reserved.
//

#import "GameManager.h"

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


@end
