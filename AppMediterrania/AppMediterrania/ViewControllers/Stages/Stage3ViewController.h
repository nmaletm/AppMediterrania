//
//  Stage3ViewController.h
//  AppMediterrania
//
//  Created by Nestor Malet on 02/02/14.
//  Copyright (c) 2014 Storn.es. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Stage3ViewController : UIViewController

@property (strong, nonatomic) IBOutlet UIImageView *backgroundImage;
@property (strong, nonatomic) IBOutlet UIButton *nextButton;

- (IBAction)nextButton:(id)sender;
- (IBAction)nextSubStage:(id)sender;
- (void) setBackground:(NSString*) newBackground;
- (void) nextButtonEnabled:(BOOL) enabled;

@end
