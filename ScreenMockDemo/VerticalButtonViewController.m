//
//  VerticalButtonViewController.m
//  ScreenMockDemo
//
//  Created by CottrellMACW7u on 8/12/14.
//  Copyright (c) 2014 CottrellMACW7u. All rights reserved.
//

#import "VerticalButtonViewController.h"

#define CURRENTLY_DISPLAYED_SCREEN      999
#define HIDDEN_SCREEN                   998
#define PARTIALY_DISPLAYED_SCREEN       997

@interface VerticalButtonViewController()

@property (nonatomic, strong)   UIView      *infoView;
@property (nonatomic, strong)   UIView      *dataView;
@property (nonatomic, strong)   UIView      *alertsView;
@property (nonatomic, strong)   UIView      *packetsView;
@property (nonatomic, strong)   UIView      *commandsView;
@property (nonatomic, strong)   UIView      *settingsView;

@end


@implementation VerticalButtonViewController {
    
    CGRect onScreenRect;
    CGRect offScreenRect;
    CGRect partialScreenRect;
}


-(void)viewDidLoad {
    
    onScreenRect = CGRectMake(0, 64, 320, 508);
    offScreenRect = CGRectMake(320, 64, 320, 508);
    partialScreenRect = CGRectMake(174, 64, 320, 508);
    
    _infoView = [[UIView alloc] initWithFrame:onScreenRect];
    _dataView = [[UIView alloc] initWithFrame:offScreenRect];
    _alertsView = [[UIView alloc] initWithFrame:offScreenRect];
    _packetsView = [[UIView alloc] initWithFrame:offScreenRect];
    _commandsView = [[UIView alloc] initWithFrame:offScreenRect];
    _settingsView = [[UIView alloc] initWithFrame:offScreenRect];
    
    _infoView.backgroundColor = [self getRandomColor];
    _dataView.backgroundColor = [self getRandomColor];
    _alertsView.backgroundColor = [self getRandomColor];
    _packetsView.backgroundColor = [self getRandomColor];
    _commandsView.backgroundColor = [self getRandomColor];
    _settingsView.backgroundColor = [self getRandomColor];
    
    [self.view addSubview: _infoView];
    [self.view addSubview: _dataView];
    [self.view addSubview: _alertsView];
    [self.view addSubview: _packetsView];
    [self.view addSubview: _commandsView];
    [self.view addSubview: _settingsView];
    
    _infoView.tag = CURRENTLY_DISPLAYED_SCREEN;
    _dataView.tag = HIDDEN_SCREEN;
    _alertsView.tag = HIDDEN_SCREEN;
    _packetsView.tag = HIDDEN_SCREEN;
    _commandsView.tag = HIDDEN_SCREEN;
    _settingsView.tag = HIDDEN_SCREEN;
    
    UIBarButtonItem *button = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"menu-26.png"] style:UIBarButtonItemStylePlain target:self action:@selector(menuButtonPressed:)];

    self.navigationItem.rightBarButtonItem = button;
    self.navigationItem.title = @"Info";
    
}


-(UIColor*)getRandomColor {
    
    CGFloat hue = ( arc4random() % 256 / 256.0 );               //  0.0 to 1.0
    CGFloat saturation = ( arc4random() % 128 / 256.0 ) + 0.5;  //  0.5 to 1.0, away from white
    CGFloat brightness = ( arc4random() % 128 / 256.0 ) + 0.5;  //  0.5 to 1.0, away from black
    return [UIColor colorWithHue:hue saturation:saturation brightness:brightness alpha:1];
}


- (IBAction)menuButtonPressed:(id)sender {
    
    UIView *view = [self getCurrentlyDisplayedView];
    
    if (view == nil) {
        
        view = [self getPartialyDisplayedView];
        
        [UIView animateWithDuration:0.4 delay:0.0 usingSpringWithDamping:2.0 initialSpringVelocity:1.0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
            
            view.frame = onScreenRect;
            view.tag = CURRENTLY_DISPLAYED_SCREEN;
            
        } completion:^(BOOL finished) {}];
        
    } else {
        
        [UIView animateWithDuration:0.4 delay:0.0 usingSpringWithDamping:2.0 initialSpringVelocity:1.0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
            
            view.frame = partialScreenRect;
            view.tag = PARTIALY_DISPLAYED_SCREEN;
            
        } completion:^(BOOL finished) {}];
    }
}


-(IBAction)buttonPressed:(UIButton*)sender {

    UIView *viewToAnimate;
    NSString *title;
    
    switch (sender.tag) {
        
        case 1:
            viewToAnimate = _infoView;
            title = @"Info";
            break;
            
        case 2:
            viewToAnimate = _dataView;
            title = @"Data";
            break;
            
        case 3:
            viewToAnimate = _alertsView;
            title = @"Alerts";
            break;
            
        case 4:

            viewToAnimate = _packetsView;
            title = @"Packets";
            
            break;
        case 5:
            
            viewToAnimate = _commandsView;
            title = @"Commands";
            
            break;
        case 6:
            
            viewToAnimate = _settingsView;
            title = @"Settings";
            
            break;
            
        default:
            break;
    }
    
    self.navigationItem.title = title;
    
    [UIView animateWithDuration:0.2 delay:0.0 usingSpringWithDamping:1.1 initialSpringVelocity:0.2 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        
        UIView *partialyDisplayedView = [self getPartialyDisplayedView];
        partialyDisplayedView.frame = offScreenRect;
        partialyDisplayedView.tag = HIDDEN_SCREEN;
        
        
    } completion:^(BOOL finished) {
        
        [UIView animateWithDuration:0.35 animations:^{
         
            viewToAnimate.frame = onScreenRect;
        }];
        viewToAnimate.tag = CURRENTLY_DISPLAYED_SCREEN;
    }];
}


-(UIView*)getCurrentlyDisplayedView {
    
    UIView *viewToReturn = nil;
    
    for (UIView *view in self.view.subviews) {
        
        if (view.tag == CURRENTLY_DISPLAYED_SCREEN) {
            
            viewToReturn = view;
            break;
        }
    }
    return viewToReturn;
}


-(UIView*)getPartialyDisplayedView {
    
    UIView *viewToReturn = nil;
    
    for (UIView *view in self.view.subviews) {
        
        if (view.tag == PARTIALY_DISPLAYED_SCREEN) {
            
            viewToReturn = view;
            break;
        }
    }
    return viewToReturn;
}

@end
