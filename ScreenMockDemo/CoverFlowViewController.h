//
//  CoverFlowViewController.h
//  ScreenMockDemo
//
//  Created by CottrellMACW7u on 8/13/14.
//  Copyright (c) 2014 CottrellMACW7u. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "iCarousel.h"

@interface CoverFlowViewController : UIViewController <iCarouselDataSource, iCarouselDelegate>

@property (nonatomic, strong) IBOutlet iCarousel    *carousel;
@property (nonatomic, strong) NSArray               *array;

@end
