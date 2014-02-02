//
//  StageViewController.h
//  AppMediterrania
//
//  Created by Nestor Malet on 30/01/14.
//  Copyright (c) 2014 Storn.es. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "StageDataSource.h"

@interface StageViewController : UIViewController

@property (nonatomic, retain) id<StageDataSource> dataSource;
@property (strong, nonatomic) IBOutlet UIView *stageView;
@property (strong, nonatomic) IBOutlet UIView *informationView;
@property (strong, nonatomic) IBOutlet UITextView *informationTextView;

- (id) initWithDataSource:(id<StageDataSource>)theDataSource;

- (IBAction)backMap:(id)sender;

@end
