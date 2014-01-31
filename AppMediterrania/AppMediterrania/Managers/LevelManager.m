//
//  LevelManager.m
//  AppMediterrania
//
//  Created by Nestor Malet on 31/01/14.
//  Copyright (c) 2014 Storn.es. All rights reserved.
//

#import "LevelManager.h"

@implementation LevelManager

@synthesize level;

#pragma mark - Shared instance creation

+ (LevelManager *)sharedInstance
{
    static LevelManager *instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [LevelManager alloc];
        instance = [instance init];
    });
    
    return instance;
}

#pragma mark - Persistence

- (void)loadData{
    self.level = [[NSUserDefaults standardUserDefaults] valueForKey:ST_DEFAULTS_LEVEL];
}

- (void)storeData{
    [[NSUserDefaults standardUserDefaults] setObject:self.level forKey:ST_DEFAULTS_LEVEL];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

#pragma mark - Actions

- (void) setNewLevel:(NSNumber *)newLevel{
    self.level = newLevel;
    [self storeData];
}

@end
