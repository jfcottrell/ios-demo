//
//  SecondaryTableViewController.m
//  ScreenMockDemo
//
//  Created by CottrellMACW7u on 8/13/14.
//  Copyright (c) 2014 CottrellMACW7u. All rights reserved.
//

#import "SecondaryTableViewController.h"
#import "SecondaryTVDetailViewController.h"

@interface SecondaryTableViewController()

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation SecondaryTableViewController

-(void)viewDidLoad {
    
    _tableView.delegate = self;
    _tableView.dataSource = self;
}


#pragma -
#pragma mark UITableView delegates

-(NSInteger)numberOfSectionsInTableView:(UITableView*)tableView {
    
    return 1;
}


-(NSInteger)tableView:(UITableView*)tableView numberOfRowsInSection:(NSInteger)section {
    
    return 6;
}


-(UITableViewCell*)tableView:(UITableView*)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *simpleTableIdentifier = @"MainTableCell";
    UITableViewCell *cell = [_tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    
    if (cell == nil) {
        
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:simpleTableIdentifier];
    }
    
    switch (indexPath.row) {
        case 0:
            cell.textLabel.text = @"Info";
            cell.imageView.image = [UIImage imageNamed:@"info-25.png"];
            break;
        case 1:
            cell.textLabel.text = @"Data";
            cell.imageView.image = [UIImage imageNamed:@"combo-26.png"];
            break;
        case 2:
            cell.textLabel.text = @"Alerts";
            cell.imageView.image = [UIImage imageNamed:@"google_alerts_copyrighted-26.png"];
            break;
        case 3:
            cell.textLabel.text = @"Packets";
            cell.imageView.image = [UIImage imageNamed:@"gps_searching-25.png"];
            break;
        case 4:
            cell.textLabel.text = @"Commands";
            cell.imageView.image = [UIImage imageNamed:@"megaphone_filled-25.png"];
            break;
        case 5:
            cell.textLabel.text = @"Settings";
            cell.imageView.image = [UIImage imageNamed:@"settings2-26.png"];
            break;
        default:
            break;
    }
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [self performSegueWithIdentifier:@"tableview_detail_segue" sender:self];
}


-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {

    NSIndexPath *path = [_tableView indexPathForSelectedRow];
    SecondaryTVDetailViewController *secondaryTVDetailViewController = segue.destinationViewController;
    
    switch (path.row) {
        case 0:
            secondaryTVDetailViewController.navigationTitle = @"Info";
            break;
        case 1:
            secondaryTVDetailViewController.navigationTitle = @"Data";
            break;
        case 2:
            secondaryTVDetailViewController.navigationTitle = @"Alerts";
            break;
        case 3:
            secondaryTVDetailViewController.navigationTitle = @"Packets";
            break;
        case 4:
            secondaryTVDetailViewController.navigationTitle = @"Commands";
            break;
        case 5:
            secondaryTVDetailViewController.navigationTitle = @"Settings";
            break;
            
        default:
            break;
    }
}

@end
