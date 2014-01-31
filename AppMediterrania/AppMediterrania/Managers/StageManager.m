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
    self.lastEndendStage = [[NSUserDefaults standardUserDefaults] valueForKey:ST_DEFAULTS_STAGE];
    if(self.lastEndendStage == nil){
        self.lastEndendStage = [NSNumber numberWithInt:1];
    }
}

- (void)storeData{
    [[NSUserDefaults standardUserDefaults] setObject:self.lastEndendStage forKey:ST_DEFAULTS_STAGE];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

@end