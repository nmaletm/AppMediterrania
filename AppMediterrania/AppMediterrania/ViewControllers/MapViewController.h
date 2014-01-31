//
//  MapViewController.h
//  AppMediterrania
//
//  Created by Nestor Malet on 28/01/14.
//  Copyright (c) 2014 Storn.es. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MapViewController : UIViewController


@property (strong, nonatomic) IBOutlet UIButton *b_stage1;
@property (strong, nonatomic) IBOutlet UIButton *b_stage2;
@property (strong, nonatomic) IBOutlet UIButton *b_stage3;
@property (strong, nonatomic) IBOutlet UIButton *b_stage4;
@property (strong, nonatomic) IBOutlet UIButton *b_stage5;
@property (strong, nonatomic) IBOutlet UIButton *b_stage6;
@property (strong, nonatomic) IBOutlet UIButton *b_stage7;
@property (strong, nonatomic) IBOutlet UIButton *b_stage8;


- (IBAction)showInformation:(id)sender;
- (IBAction)showLevelSelector:(id)sender;

- (IBAction)stage1:(id)sender;
- (IBAction)stage2:(id)sender;
- (IBAction)stage3:(id)sender;
- (IBAction)stage4:(id)sender;
- (IBAction)stage5:(id)sender;
- (IBAction)stage6:(id)sender;
- (IBAction)stage7:(id)sender;
- (IBAction)stage8:(id)sender;


@end
