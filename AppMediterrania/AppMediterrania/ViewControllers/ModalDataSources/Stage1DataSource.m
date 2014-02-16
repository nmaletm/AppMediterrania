//
//  Stage1DataSource.m
//  AppMediterrania
//
//  Created by Nestor Malet on 31/01/14.
//  Copyright (c) 2014 Storn.es. All rights reserved.
//

#import "Stage1DataSource.h"
#import "Stage1SeasonsViewController.h"
#import "Stage1FarmViewController.h"
#import "Stage1FishingViewController.h"

#import "LevelManager.h"

@interface Stage1DataSource (){
    NSArray *views;
    NSMutableDictionary *texts;
    int currentSubStage;
}

@end

@implementation Stage1DataSource
@synthesize viewController;

- (BOOL ) hasText{
    return YES;
}

- (BOOL ) hasNextButton{
    return YES;
}

- (void) initView{
    currentSubStage = 0;
    views = [[NSArray alloc] initWithObjects:
             [[Stage1SeasonsViewController alloc] initWithNibName:@"Stage1SeasonsView" bundle:nil withBackground:@"pantalla_agricultura_01"],
             [[Stage1SeasonsViewController alloc] initWithNibName:@"Stage1SeasonsView" bundle:nil withBackground:@"pantalla_agricultura_02"],
             [[Stage1FarmViewController alloc] initWithNibName:@"Stage1FarmView" bundle:nil],
             [[Stage1FishingViewController alloc] initWithNibName:@"Stage1FishingView" bundle:nil],
             nil];
    
    texts = [[NSMutableDictionary alloc] init];
    NSArray *textEasy = [[NSArray alloc] initWithObjects:
                         @"La Dieta Mediterránea se compone sobre todo de frutas, verduras, hortalizas y cereales. Descubre qué productos recoge el agricultor en las diferentes estaciones del año: primavera, verano, otoño, invierno.",
                         @"La Dieta Mediterránea se compone sobre todo de frutas, verduras, hortalizas y cereales. Descubre qué productos recoge el agricultor en las diferentes estaciones del año: primavera, verano, otoño, invierno.",
                         @"Mediante la actividad ganadera obtenemos los productos que provienen de los animales como el queso, la leche, la carne, los huevos, etc. Descubre cuales son los principales animales que habitan nuestras granjas.",
                         @"Mediante la pesca también obtenemos variedad de alimentos provenientes del mar, como el pescado y el marisco. Descubre qué productos indispensables de la Dieta Mediterránea vienen del mar.",
             nil];
    [texts setObject:textEasy forKey:@"1"];
    
    NSArray *textMedium = [[NSArray alloc] initWithObjects:
                           @"La Dieta Mediterránea se compone sobre todo de frutas, verduras, hortalizas y cereales. Descubre qué productos recoge el agricultor en las diferentes estaciones del año: primavera, verano, otoño, invierno.",
                           @"La Dieta Mediterránea se compone sobre todo de frutas, verduras, hortalizas y cereales. Descubre qué productos recoge el agricultor en las diferentes estaciones del año: primavera, verano, otoño, invierno.",
                           @"Mediante la actividad ganadera obtenemos los productos que provienen de los animales como el queso, la leche, la carne, los huevos, etc. Descubre cuales son los principales animales que habitan nuestras granjas.",
                           @"Mediante la pesca también obtenemos variedad de alimentos provenientes del mar, como el pescado y el marisco. Descubre qué productos indispensables de la Dieta Mediterránea vienen del mar.",
                           nil];
    [texts setObject:textMedium forKey:@"2"];

    NSArray *textDificult = [[NSArray alloc] initWithObjects:
                             @"La Dieta Mediterránea se compone sobre todo de frutas, verduras, hortalizas y cereales. Descubre qué productos recoge el agricultor en las diferentes estaciones del año: primavera, verano, otoño, invierno.",
                             @"La Dieta Mediterránea se compone sobre todo de frutas, verduras, hortalizas y cereales. Descubre qué productos recoge el agricultor en las diferentes estaciones del año: primavera, verano, otoño, invierno.",
                             @"Mediante la actividad ganadera obtenemos los productos que provienen de los animales como el queso, la leche, la carne, los huevos, etc. Descubre cuales son los principales animales que habitan nuestras granjas.",
                             @"Mediante la pesca también obtenemos variedad de alimentos provenientes del mar, como el pescado y el marisco. Descubre qué productos indispensables de la Dieta Mediterránea vienen del mar.",
                           nil];
    [texts setObject:textDificult forKey:@"3"];

    viewController = [views objectAtIndex: currentSubStage];
}

- (NSString *) text{
    return [[texts objectForKey:[[LevelManager sharedInstance] levelString]] objectAtIndex:currentSubStage];
}


- (UIViewController *) viewController{
    viewController = [views objectAtIndex: currentSubStage];
    return viewController;
}

- (void) goNextSubLevel{
    if(currentSubStage < [views count]-1){
        currentSubStage++;
    }
}

@end
