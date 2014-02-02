//
//  StageManager.m
//  AppMediterrania
//
//  Created by Nestor Malet on 31/01/14.
//  Copyright (c) 2014 Storn.es. All rights reserved.
//

#import "StageManager.h"

@implementation StageManager
@synthesize lastEndendStage;

#pragma mark - Shared instance creation

+ (StageManager *)sharedInstance
{
    static StageManager *instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [StageManager alloc];
        instance = [instance init];
    });
    
    return instance;
}

#pragma mark - Persistence

- (void)loadData{
    lastEndendStage = [[NSUserDefaults standardUserDefaults] valueForKey:ST_DEFAULTS_STAGE];
    if(lastEndendStage == nil){
        lastEndendStage = [NSNumber numberWithInt:0];
    }
}

- (void)storeData{
    [[NSUserDefaults standardUserDefaults] setObject:self.lastEndendStage forKey:ST_DEFAULTS_STAGE];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

#pragma mark - Stage managment

- (void) markAsCompleted:(int)stage{
    if([lastEndendStage intValue] < stage){
        lastEndendStage = [NSNumber numberWithInt:stage];
        [self storeData];
    }
}

- (void) reset{
    lastEndendStage = [NSNumber numberWithInt:0];
    [self storeData];
}

@end