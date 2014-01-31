//
//  LevelManager.h
//  AppMediterrania
//
//  Created by Nestor Malet on 31/01/14.
//  Copyright (c) 2014 Storn.es. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LevelManager : NSObject

@property (strong, readwrite, nonatomic) NSNumber *level;


+ (LevelManager *)sharedInstance;

- (void)loadData;
- (void)storeData;
- (void) setNewLevel:(NSNumber *)newLevel;

@end
