//
//  Stage1DataSource.m
//  AppMediterrania
//
//  Created by Nestor Malet on 31/01/14.
//  Copyright (c) 2014 Storn.es. All rights reserved.
//

#import "Stage1DataSource.h"
#import "Stage1TreeViewController.h"
#import "Stage1BasketViewController.h"
#import "Stage1FieldViewController.h"
#import "Stage1FarmViewController.h"
#import "Stage1FishingViewController.h"

#import "LevelManager.h"

@interface Stage1DataSource (){
    NSArray *views;
    NSMutableDictionary *texts;
    int currentView;
}

@end

@implementation Stage1DataSource
@synthesize viewController;

- (BOOL ) hasText{
    return YES;
}

- (void) initView{
    currentView = 0;
    views = [[NSArray alloc] initWithObjects:
             [[Stage1TreeViewController alloc] initWithNibName:@"Stage1TreeView" bundle:nil],
             [[Stage1BasketViewController alloc] initWithNibName:@"Stage1BasketView" bundle:nil],
             [[Stage1FieldViewController alloc] initWithNibName:@"Stage1FieldView" bundle:nil],
             [[Stage1FarmViewController alloc] initWithNibName:@"Stage1FarmView" bundle:nil],
             [[Stage1FishingViewController alloc] initWithNibName:@"Stage1FishingView" bundle:nil],
             nil];
    
    texts = [[NSMutableDictionary alloc] init];
    NSArray *textEasy = [[NSArray alloc] initWithObjects:
                         @"Nivell facil, pantalla 1. Title: Rooster Crow About: Awesome sound of a rooster crowing early in the morning. great farming or alarm clock sound effects. Uploaded: 11.29.09 ",
                         @"Nivell facil, pantalla 2. Title: Rooster Crow About: Awesome sound of a rooster crowing early in the morning. great farming or alarm clock sound effects. Uploaded: 11.29.09 ",
                         @"Nivell facil, pantalla 3. Title: Rooster Crow About: Awesome sound of a rooster crowing early in the morning. great farming or alarm clock sound effects. Uploaded: 11.29.09 ",
                         @"Nivell facil, pantalla 4. Title: Rooster Crow About: Awesome sound of a rooster crowing early in the morning. great farming or alarm clock sound effects. Uploaded: 11.29.09 ",
                         @"Nivell facil, pantalla 5. Title: Rooster Crow About: Awesome sound of a rooster crowing early in the morning. great farming or alarm clock sound effects. Uploaded: 11.29.09 ",
             nil];
    [texts setObject:textEasy forKey:@"1"];
    
    NSArray *textMedium = [[NSArray alloc] initWithObjects:
                         @"Nivell mitjà, pantalla 1. Title: Rooster Crow About: Awesome sound of a rooster crowing early in the morning. great farming or alarm clock sound effects. Uploaded: 11.29.09 ",
                         @"Nivell mitjà, pantalla 2. Title: Rooster Crow About: Awesome sound of a rooster crowing early in the morning. great farming or alarm clock sound effects. Uploaded: 11.29.09 ",
                         @"Nivell mitjà, pantalla 3. Title: Rooster Crow About: Awesome sound of a rooster crowing early in the morning. great farming or alarm clock sound effects. Uploaded: 11.29.09 ",
                         @"Nivell mitjà, pantalla 4. Title: Rooster Crow About: Awesome sound of a rooster crowing early in the morning. great farming or alarm clock sound effects. Uploaded: 11.29.09 ",
                         @"Nivell mitjà, pantalla 5. Title: Rooster Crow About: Awesome sound of a rooster crowing early in the morning. great farming or alarm clock sound effects. Uploaded: 11.29.09 ",
                           nil];
    [texts setObject:textMedium forKey:@"2"];

    NSArray *textDificult = [[NSArray alloc] initWithObjects:
                           @"Nivell dificl, pantalla 1. Title: Rooster Crow About: Awesome sound of a rooster crowing early in the morning. great farming or alarm clock sound effects. Uploaded: 11.29.09 ",
                           @"Nivell dificl, pantalla 2. Title: Rooster Crow About: Awesome sound of a rooster crowing early in the morning. great farming or alarm clock sound effects. Uploaded: 11.29.09 ",
                           @"Nivell dificl, pantalla 3. Title: Rooster Crow About: Awesome sound of a rooster crowing early in the morning. great farming or alarm clock sound effects. Uploaded: 11.29.09 ",
                           @"Nivell dificl, pantalla 4. Title: Rooster Crow About: Awesome sound of a rooster crowing early in the morning. great farming or alarm clock sound effects. Uploaded: 11.29.09 ",
                           @"Nivell dificl, pantalla 5. Title: Rooster Crow About: Awesome sound of a rooster crowing early in the morning. great farming or alarm clock sound effects. Uploaded: 11.29.09 ",
                           nil];
    [texts setObject:textDificult forKey:@"3"];

    viewController = [views objectAtIndex: currentView];
}

- (NSString *) text{
    return [[texts objectForKey:[[LevelManager sharedInstance] levelString]] objectAtIndex:currentView];
}


- (UIViewController *) viewController{
    viewController = [views objectAtIndex: currentView];
    return viewController;
}

- (void) goNextSubLevel{
    currentView++;
}

@end
