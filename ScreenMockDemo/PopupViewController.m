//
//  PopupViewController.m
//  ScreenMockDemo
//
//  Created by CottrellMACW7u on 8/13/14.
//  Copyright (c) 2014 CottrellMACW7u. All rights reserved.
//

#import "PopupViewController.h"
#import "btSimplePopUP.h"
#import <QuartzCore/QuartzCore.h>
#import <Accelerate/Accelerate.h>

@interface PopupViewController()

@property(nonatomic, retain) btSimplePopUP *popUp;

@end


@implementation PopupViewController


-(void)viewDidLoad {
    
    _popUp = [[btSimplePopUP alloc]initWithItemImage:@[
                                                      [UIImage imageNamed:@"mic.png"],
                                                      [UIImage imageNamed:@"combo-26.png"],
                                                      [UIImage imageNamed:@"google_alerts_copyrighted-26.png"],
                                                      [UIImage imageNamed:@"gps_searching-25.png"],
                                                      [UIImage imageNamed:@"megaphone_filled-25.png"],
                                                      [UIImage imageNamed:@"settings2-26.png"]
                                                      ]
                                          andTitles:    @[
                                                          @"Info", @"Data",@"Alerts", @"Packets", @"Commands", @"Settings"]
             
                                     andActionArray:@[]
                                addToViewController:self];
    
    [self.view addSubview:_popUp];
    [_popUp setPopUpStyle:BTPopUpStyleDefault];
    [_popUp setPopUpBorderStyle:BTPopUpBorderStyleDefaultNone];
    [_popUp setPopUpBackgroundColor:[UIColor colorWithRed:0.1 green:0.2 blue:0.6 alpha:0.7]];
}


- (IBAction)pressMeButtonPressed:(id)sender {
    
    [_popUp show];
}

@end
