//
//  Stage2DataSource.m
//  AppMediterrania
//
//  Created by Nestor Malet on 02/02/14.
//  Copyright (c) 2014 Storn.es. All rights reserved.
//

#import "Stage2DataSource.h"
#import "Stage2ViewController.h"
#import "StageManager.h"
#import "LevelManager.h"

@interface Stage2DataSource (){
    NSMutableDictionary *texts;
    NSArray *backgrounds;
    int currentView;
}

@end

@implementation Stage2DataSource
@synthesize viewController;

- (BOOL ) hasText{
    return YES;
}

- (void) initView{
    currentView = 0;
    viewController = [[Stage2ViewController alloc] initWithNibName:@"Stage2View" bundle:nil];
    backgrounds = [[NSArray alloc] initWithObjects:
                  @"pantalla_cuina_1",
                  @"pantalla_cuina_2",
                  @"pantalla_cuina_3",
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
    
}

- (NSString *) text{
    return [[texts objectForKey:[[LevelManager sharedInstance] levelString]] objectAtIndex:currentView];
}


- (UIViewController *) viewController{
    return viewController;
}

- (void) goNextSubLevel{
    Stage2ViewController *stageViewController = (Stage2ViewController*) viewController;
    
    if(currentView+1 >= [backgrounds count]){
        [stageViewController nextButtonEnabled:YES];
    }
    else{
        currentView++;
    }
    
    [stageViewController setBackground:[backgrounds objectAtIndex:currentView]];
}

@end
