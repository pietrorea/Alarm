//
//  SetAlarmTableViewController.m
//  GeoWake
//
//  Created by Pietro Rea on 4/28/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "SetAlarmTableViewController.h"

@interface SetAlarmTableViewController ()

@end

@implementation SetAlarmTableViewController

@synthesize coordinatesLabel;
@synthesize leavingTimeTextLabel;
@synthesize timePicker;
@synthesize prepTimeTextLabel;
@synthesize delegate;

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


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

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
    [self.delegate doneSettingAlarm:leavingTimeTextLabel.text
                 andPrepTimeMinutes:prepTimeTextLabel.text];
    
}

- (void)startMonitoringForLocationChanges:(CLLocation *)location
{
    NSLog(@"HELLO?");
    NSLog(@"%@", location);
    
    // Create region and start monitoring it
    
    
    // Set coordinates label
    self.coordinatesLabel.text = [NSString stringWithFormat:@"%f, %f", location.coordinate.latitude, location.coordinate.longitude];
    
    // Dismiss location view controller
    [self.navigationController popViewControllerAnimated:YES];
    
}

- (void)locationManager:(CLLocationManager *)manager didExitRegion:(CLRegion *)region
{
    
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender 
{    
    SettingsViewController *settingsVC = segue.destinationViewController;
    settingsVC.delegate = self;
}

- (void) timeChanged
{
    
    NSIndexPath * pathToSelectedRow = [self.tableView indexPathForSelectedRow];
    
    if (pathToSelectedRow.row == 0) {
        
        NSDate * selectedDate = [timePicker date];
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
