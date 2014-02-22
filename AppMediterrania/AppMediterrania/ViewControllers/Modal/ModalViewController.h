//
//  Modal.h
//  AppMediterrania
//
//  Created by Nestor Malet on 30/01/14.
//  Copyright (c) 2014 Storn.es. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ModalDataSource.h"

@interface ModalViewController : UIViewController

@property (nonatomic, retain) id<ModalDataSource> dataSource;
@property (strong, nonatomic) IBOutlet UIView *stageView;
@property (strong, nonatomic) IBOutlet UIButton *nextButton;
@property (strong, nonatomic) IBOutlet UIButton *backMapButton;
@property (strong, nonatomic) IBOutlet UIView *informationView;
@property (strong, nonatomic) IBOutlet UITextView *informationTextView;

- (id) initWithDataSource:(id<ModalDataSource>)theDataSource;

- (IBAction)backMap:(id)sender;
- (IBAction)nextButton:(id)sender;

@end
