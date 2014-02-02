//
//  StageGameDataSource.h
//  AppMediterrania
//
//  Created by Nestor Malet on 02/02/14.
//  Copyright (c) 2014 Storn.es. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "StageDataSource.h"

@interface StageGameDataSource : NSObject <StageDataSource>

@property (atomic) int stage;

@end
