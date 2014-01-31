//
//  StageManager.h
//  AppMediterrania
//
//  Created by Nestor Malet on 31/01/14.
//  Copyright (c) 2014 Storn.es. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface StageManager : NSObject

@property (strong, readwrite, nonatomic) NSNumber *lastEndendStage;


+ (StageManager *)sharedInstance;

- (void)loadData;
- (void)storeData;

@end
