//
//  Stage1FishingViewController.h
//  AppMediterrania
//
//  Created by Nestor Malet on 31/01/14.
//  Copyright (c) 2014 Storn.es. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Stage1FishingViewController : UIViewController

@property (strong, nonatomic) IBOutlet UIButton *nextButton;

- (IBAction)nextButton:(id)sender;

- (IBAction)clickSea:(id)sender;
- (IBAction)clickSky:(id)sender;
@end
