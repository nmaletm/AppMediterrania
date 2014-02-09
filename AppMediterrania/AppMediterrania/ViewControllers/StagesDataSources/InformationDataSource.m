//
//  InformationDataSource.m
//  DietMed
//
//  Created by Nestor Malet on 09/02/14.
//  Copyright (c) 2014 Storn.es. All rights reserved.
//

#import "InformationDataSource.h"
#import "InformationViewController.h"

@implementation InformationDataSource
@synthesize viewController;

- (BOOL ) hasText{
    return NO;
}

- (NSString *) text{
    return nil;
}

- (void) initView{
    viewController = [[InformationViewController alloc] initWithNibName:@"InformationView" bundle:nil];
}


@end
