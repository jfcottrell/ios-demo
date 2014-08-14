//
//  CoverFlowViewController.m
//  ScreenMockDemo
//
//  Created by CottrellMACW7u on 8/13/14.
//  Copyright (c) 2014 CottrellMACW7u. All rights reserved.
//

#import "CoverFlowViewController.h"

@implementation CoverFlowViewController {
    
    int index;
}

-(void)viewDidLoad {
    
    _carousel.type = iCarouselTypeRotary;
    _carousel.dataSource = self;
    _carousel.delegate = self;
    index = 0;
    _array = [[NSArray alloc] initWithObjects:@"Info", @"Data", @"Alerts", @"Packets", @"Commands", @"Settings", nil];
}


- (IBAction)nextButtonPressed:(id)sender {
    
    index++;
    if (index > 5) index = 0;
    
    switch (index) {
        case 0:
            _carousel.type = iCarouselTypeRotary;
            break;
        case 1:
            _carousel.type = iCarouselTypeCylinder;
            break;
        case 2:
            _carousel.type = iCarouselTypeCoverFlow;
            break;
        case 3:
            _carousel.type = iCarouselTypeWheel;
            break;
        case 4:
            _carousel.type = iCarouselTypeTimeMachine;
            break;
        case 5:
            _carousel.type = iCarouselTypeLinear;
            break;
        default:
            break;
    }
}


#pragma mark -
#pragma mark iCarousel methods

- (NSInteger)numberOfItemsInCarousel:(iCarousel *)carousel
{
    return 6;//[_array count];
}

- (UIView *)carousel:(iCarousel *)carousel viewForItemAtIndex:(NSInteger)index reusingView:(UIView *)view
{
    UILabel *label = nil;
    
    //create new view if no view is available for recycling
    if (view == nil)
    {
        view = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 200.0f, 200.0f)];
        ((UIImageView *)view).image = [UIImage imageNamed:@"page.png"];
        view.contentMode = UIViewContentModeCenter;
        label = [[UILabel alloc] initWithFrame:view.bounds];
        label.backgroundColor = [UIColor clearColor];
        label.textAlignment = UITextAlignmentCenter;
        label.font = [label.font fontWithSize:30];
        label.tag = 1;
        [view addSubview:label];
    }
    else
    {
        //get a reference to the label in the recycled view
        label = (UILabel *)[view viewWithTag:1];
    }
    
    //set item label
    //remember to always set any properties of your carousel item
    //views outside of the `if (view == nil) {...}` check otherwise
    //you'll get weird issues with carousel item content appearing
    //in the wrong place in the carousel
    
    switch (index) {
        case 0:
            label.text = @"Info";
            break;
        case 1:
            label.text = @"Data";
            break;
        case 2:
            label.text = @"Alerts";
            break;
        case 3:
            label.text = @"Packets";
            break;
        case 4:
            label.text = @"Commands";
            break;
        case 5:
            label.text = @"Settings";
            break;
        default:
            break;
    }

    return view;
}
@end
