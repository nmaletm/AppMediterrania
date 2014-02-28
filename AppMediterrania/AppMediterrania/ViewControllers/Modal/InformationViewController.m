//
//  InformationViewController.m
//  DietMed
//
//  Created by Nestor Malet on 09/02/14.
//  Copyright (c) 2014 Storn.es. All rights reserved.
//

#import "InformationViewController.h"
#import "StageManager.h"
#import "LevelManager.h"

@interface InformationViewController ()

@end

@implementation InformationViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark Actions
- (IBAction)showReset:(id)sender{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:NAME_APP message:@"¿Estas seguro que quieres volver al inicio del juego?" delegate:self cancelButtonTitle:@"Cancelar" otherButtonTitles:@"Resetear juego",nil];
    [alert show];
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    if (buttonIndex != [alertView cancelButtonIndex]) {
        [[LevelManager sharedInstance] reset];
        [[StageManager sharedInstance] reset];
        [[NSNotificationCenter defaultCenter] postNotificationName:NOT_BACK_TO_MAP object:self];
    }
}
@end
