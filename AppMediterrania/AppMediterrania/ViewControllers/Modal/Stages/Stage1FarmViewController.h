//
//  Stage1FarmViewController.h
//  AppMediterrania
//
//  Created by Nestor Malet on 31/01/14.
//  Copyright (c) 2014 Storn.es. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Stage1FarmViewController : UIViewController

@property (strong, nonatomic) IBOutlet UIButton *nextButton;


- (IBAction)clickGoat:(id)sender;
- (IBAction)clickSheep:(id)sender;
- (IBAction)clickCow:(id)sender;
- (IBAction)clickPork:(id)sender;
- (IBAction)clickHen:(id)sender;

@end
