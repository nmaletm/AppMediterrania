//
//  Stage8ViewController.m
//  AppMediterrania
//
//  Created by Nestor Malet on 30/01/14.
//  Copyright (c) 2014 Storn.es. All rights reserved.
//

#import "Stage8ViewController.h"
#import "LevelManager.h"

@interface Stage8ViewController ()

@end

@implementation Stage8ViewController

@synthesize imageView;

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
	
    NSMutableDictionary *images = [[NSMutableDictionary alloc] init];
    [images setObject:@"pantalla_receptes_facil" forKey:@"1"];
    [images setObject:@"pantalla_receptes_mitja" forKey:@"2"];
    [images setObject:@"pantalla_receptes_dificil" forKey:@"3"];
    
    UIImage *image = [UIImage imageNamed: [images objectForKey:[[LevelManager sharedInstance] levelString]]];
    [imageView setImage:image];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
