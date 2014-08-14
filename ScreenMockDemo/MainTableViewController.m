//
//  MainTableViewController.m
//  ScreenMockDemo
//
//  Created by CottrellMACW7u on 8/12/14.
//  Copyright (c) 2014 CottrellMACW7u. All rights reserved.
//

#import "MainTableViewController.h"

@interface MainTableViewController() <UITableViewDataSource, UITableViewDelegate>

@property (weak, nonatomic)     IBOutlet    UITableView     *tableView;
@property (nonatomic, strong)   NSMutableArray              *array;

@end


@implementation MainTableViewController

-(void)viewDidLoad {
    
    _tableView.delegate = self;
    _tableView.dataSource = self;
    
    _array = [[NSMutableArray alloc] init];
    [_array addObject:@"Tab View Controller"];
    [_array addObject:@"Scroll View Controller"];
    [_array addObject:@"Vertical Buttons"];
    [_array addObject:@"Table View Controller"];
    [_array addObject:@"Cover Flow"];
    [_array addObject:@"Popup"];
    [_array addObject:@"Side Scroll Menu"];
}


#pragma -
#pragma mark UITableView delegates

-(NSInteger)numberOfSectionsInTableView:(UITableView*)tableView {
    
    return 1;
}


-(NSInteger)tableView:(UITableView*)tableView numberOfRowsInSection:(NSInteger)section {
    
    return [_array count];
}


-(UITableViewCell*)tableView:(UITableView*)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *simpleTableIdentifier = @"MainTableCell";
    UITableViewCell *cell = [_tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    
    if (cell == nil) {
        
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:simpleTableIdentifier];
    }

    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    cell.textLabel.text = [_array objectAtIndex:indexPath.row];
    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.row == 0) {
        [self performSegueWithIdentifier:@"tabview_segue" sender:self];
    }
    
    if (indexPath.row == 1) {
        [self performSegueWithIdentifier:@"scrollview_segue" sender:self];
    }
    
    if (indexPath.row == 2) {
        [self performSegueWithIdentifier:@"verticalbutton_segue" sender:self];
    }
    
    if (indexPath.row == 3) {
        [self performSegueWithIdentifier:@"tableview_segue" sender:self];
    }
    
    if (indexPath.row == 4) {
        [self performSegueWithIdentifier:@"coverflow_segue" sender:self];
    }
    
    if (indexPath.row == 5) {
        [self performSegueWithIdentifier:@"popup_segue" sender:self];
    }
    
    if (indexPath.row == 6) {
        [self performSegueWithIdentifier:@"sidescroll_segue" sender:self];
    }
    
    
    
}


@end
