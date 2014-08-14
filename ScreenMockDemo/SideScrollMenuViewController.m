//
//  SideScrollMenuViewController.m
//  ScreenMockDemo
//
//  Created by CottrellMACW7u on 8/14/14.
//  Copyright (c) 2014 CottrellMACW7u. All rights reserved.
//

#import "SideScrollMenuViewController.h"
#import "SideScrollMenuView.h"

@implementation SideScrollMenuViewController

-(void)viewDidLoad {
    
    SideScrollMenuView *menu = [[SideScrollMenuView alloc] initWithFrame:CGRectMake(20, 100, 100, 300)];
    [self.view addSubview:menu];
    
    self.view.backgroundColor = [UIColor lightGrayColor];
}

@end
