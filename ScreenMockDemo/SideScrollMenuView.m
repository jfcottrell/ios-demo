//
//  SideScrollMenuView.m
//  ScreenMockDemo
//
//  Created by CottrellMACW7u on 8/14/14.
//  Copyright (c) 2014 CottrellMACW7u. All rights reserved.
//

#import "SideScrollMenuView.h"

@implementation SideScrollMenuView


- (void)initialize{
    //init your ivars here
}


- (id)initWithFrame:(CGRect)rect{
    if(self = [super initWithFrame:rect]){
        [self initialize];
        
        self.backgroundColor = [UIColor whiteColor];
        //self.layer.borderColor = [UIColor blackColor].CGColor;
        //self.layer.borderWidth = 1.5f;
        
        UIBezierPath *shadowPath = [UIBezierPath bezierPathWithRect:self.bounds];
        self.layer.masksToBounds = NO;
        self.layer.shadowColor = [UIColor blackColor].CGColor;
        //self.layer.shadowOffset = CGSizeMake(0.0f, 5.0f);
        self.layer.shadowOffset = CGSizeMake(2.0f, 9.0f);
        self.layer.shadowOpacity = 0.5f;
        self.layer.shadowPath = shadowPath.CGPath;
        
        self.layer.cornerRadius = 3.0f;
        
        UIImageView *infoImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"info-25.png"]];
        //[infoImageView setFrame:CGRectMake(8, 8, infoImageView.bounds.size.width, infoImageView.bounds.size.height)];
        
        [infoImageView setFrame:CGRectMake(8, 8, 50, 50)];
        [self addSubview:infoImageView];
        
        
        
        
    }
    return self;
}




@end
