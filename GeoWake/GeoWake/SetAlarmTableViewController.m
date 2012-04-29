//
//  SetAlarmTableViewController.m
//  GeoWake
//
//  Created by Pietro Rea on 4/28/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "SetAlarmTableViewController.h"

NSDate *currentAlarmDate;

@interface SetAlarmTableViewController ()

@end

@implementation SetAlarmTableViewController

@synthesize coordinatesLabel;
@synthesize leavingTimeTextLabel;
@synthesize timePicker;
@synthesize prepTimeTextLabel;
@synthesize delegate;
@synthesize location;

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    currentAlarmDate = [NSDate date];
    [timePicker addTarget:self action:@selector(timeChanged) forControlEvents:UIControlEventValueChanged];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)viewDidUnload
{
    [self setLeavingTimeTextLabel:nil];
    [self setPrepTimeTextLabel:nil];
    [self setTimePicker:nil];
    [self setPrepTimeTextLabel:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0) {
        
        timePicker.datePickerMode = UIDatePickerModeTime;
        
    }
    
    else if (indexPath.row == 1) {
        
        timePicker.datePickerMode = UIDatePickerModeCountDownTimer;
        
    }
    

}

- (IBAction)doneSettingAlarmButton:(id)sender 
{
    [self.delegate doneSettingAlarm:currentAlarmDate
                 andPrepTimeMinutes:prepTimeTextLabel.text andLocation:self.location];
    
}

- (void)saveLocation:(CLLocation *)loc
{
    NSLog(@"%@", loc);
    
    // Save location
    self.location = loc;
    
    // Set coordinates label
    self.coordinatesLabel.text = [NSString stringWithFormat:@"%f, %f", self.location.coordinate.latitude, self.location.coordinate.longitude];
    
    // Dismiss location view controller
    [self.navigationController popViewControllerAnimated:YES];
    
}

- (void)locationManager:(CLLocationManager *)manager didExitRegion:(CLRegion *)region
{
    
}

- (void) timeChanged
{
    
    NSIndexPath * pathToSelectedRow = [self.tableView indexPathForSelectedRow];
    
    if (pathToSelectedRow.row == 0) {
        
        NSDate * selectedDate = [timePicker date];
        currentAlarmDate = selectedDate;
        NSDateFormatter * dateFormatter = [[NSDateFormatter alloc] init];
        dateFormatter.dateFormat = @"h:mma";
        NSString *dateString = [dateFormatter stringFromDate:selectedDate];
        leavingTimeTextLabel.text = dateString;
        
        NSLog(@"%@", selectedDate);
    }
    
    if (pathToSelectedRow.row == 1) {
        
        NSDate * selectedDate = [timePicker date];
        NSDateFormatter * dateFormatter = [[NSDateFormatter alloc] init];
        dateFormatter.dateFormat = @"h:mm";
        NSString *dateString = [dateFormatter stringFromDate:selectedDate];
        prepTimeTextLabel.text = dateString;
        
        NSLog(@"%@", selectedDate);
    }

        
    NSLog(@"The timePicker value has changed!");
}

@end
