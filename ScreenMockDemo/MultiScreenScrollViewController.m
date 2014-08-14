//
//  MultiScreenScrollViewController.m
//  ScreenMockDemo
//
//  Created by CottrellMACW7u on 8/12/14.
//  Copyright (c) 2014 CottrellMACW7u. All rights reserved.
//

#import "MultiScreenScrollViewController.h"

@interface MultiScreenScrollViewController()


@end


@implementation MultiScreenScrollViewController {
    
    UIPageControl   *pageControl;
    UIScrollView    *scrollView;
}


-(void)viewDidLoad {
    
    CGRect screenRect = self.view.bounds;
    
    scrollView = [[UIScrollView alloc] initWithFrame:screenRect];
    [self.view addSubview:scrollView];
    
    CGRect bigRect = CGRectMake(0, 60, 1920, 568);
    UIView *myView = [[UIView alloc] initWithFrame: bigRect];
    [scrollView addSubview:myView];
    
    scrollView.contentSize = bigRect.size;
    scrollView.pagingEnabled = YES;
    scrollView.delegate = self;
    
    for (int i=0; i<6; i++) {
        
        UIView *subView = [[UIView alloc] initWithFrame:CGRectMake(i*320, 0, 320, 568)];
        
        CGFloat hue = ( arc4random() % 256 / 256.0 );  //  0.0 to 1.0
        CGFloat saturation = ( arc4random() % 128 / 256.0 ) + 0.5;  //  0.5 to 1.0, away from white
        CGFloat brightness = ( arc4random() % 128 / 256.0 ) + 0.5;  //  0.5 to 1.0, away from black
        UIColor *color = [UIColor colorWithHue:hue saturation:saturation brightness:brightness alpha:1];
        
        subView.backgroundColor = color;
        
        [myView addSubview:subView];
    }
    
    pageControl = [[UIPageControl alloc] init]; //SET a property of UIPageControl
    pageControl.frame = CGRectMake(100,self.view.frame.size.height-100,self.view.frame.size.width-200,100);
    pageControl.numberOfPages = 6; //as we added 3 diff views
    pageControl.currentPage = 0;
    
    [self.view addSubview:pageControl];
    
    self.navigationItem.title = @"Info";
    
}


- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    
    CGFloat pageWidth = scrollView.frame.size.width;
    int page = floor((scrollView.contentOffset.x - pageWidth / 2 ) / pageWidth) + 1;
    
    //int page = floor((scrollView.contentOffset.x – pageWidth / 2 ) / pageWidth) + 1; //this provide you the page number
    pageControl.currentPage = page;// this displays the white dot as current page
    
    switch (page) {
        case 0:
            self.navigationItem.title = @"Info";
            break;
        case 1:
            self.navigationItem.title = @"Data";
            break;
        case 2:
            self.navigationItem.title = @"Alerts";
            break;
        case 3:
            self.navigationItem.title = @"Packets";
            break;
        case 4:
            self.navigationItem.title = @"Commands";
            break;
        case 5:
            self.navigationItem.title = @"Settings";
            break;
        default:
            break;
    }
}

@end
