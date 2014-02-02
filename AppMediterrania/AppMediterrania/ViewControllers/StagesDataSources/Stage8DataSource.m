//
//  Stage8DataSource.m
//  AppMediterrania
//
//  Created by Nestor Malet on 31/01/14.
//  Copyright (c) 2014 Storn.es. All rights reserved.
//

#import "Stage8DataSource.h"
#import "Stage8ViewController.h"

@implementation Stage8DataSource
@synthesize viewController;

- (BOOL ) hasText{
    return NO;
}

- (NSString *) text{
    return nil;
}

- (void) initView{
    viewController = [[Stage8ViewController alloc] initWithNibName:@"Stage8View" bundle:nil];
}

@end
