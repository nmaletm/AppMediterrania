//
//  ModalDataSource.h
//  AppMediterrania
//
//  Created by Nestor Malet on 31/01/14.
//  Copyright (c) 2014 Storn.es. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

@protocol ModalDataSource <NSObject>

@required

@property (readonly) BOOL hasText;
@property (readonly) BOOL hasNextButton;
@property (readwrite) UIViewController *viewController;

- (void) initView;


@optional

@property (readonly) NSString *text;

- (void) goNextSubLevel;

@end
