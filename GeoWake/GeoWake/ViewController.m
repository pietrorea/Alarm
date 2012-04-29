//
//  ViewController.m
//  GeoWake
//
//  Created by Pietro Rea on 4/28/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "SetAlarmTableViewController.h"
#import "ViewController.h"
#import <CoreLocation/CoreLocation.h>
#import "AppDelegate.h"

@interface ViewController ()

@end

@implementation ViewController 

@synthesize displayTimeTextLabel;
@synthesize alarmStatusTextLabel;
@synthesize alarmButton;

@synthesize locationManager;
@synthesize location;
@synthesize disableAlarm;
@synthesize localNotification;


- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidUnload
{
    [self setDisplayTimeTextLabel:nil];
    [self setAlarmStatusTextLabel:nil];
    [self setAlarmButton:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

- (void)startLocationMonitor
{
    self.locationManager = [[CLLocationManager alloc] init];
    self.locationManager.desiredAccuracy = kCLLocationAccuracyBest;
    self.locationManager.delegate = self;
    
    CLRegion *region = [[CLRegion alloc] initCircularRegionWithCenter:self.location.coordinate radius:10 identifier:@"HomeRegion"];

    [self.locationManager startUpdatingLocation];
    
}

- (void)locationManager:(CLLocationManager *)manager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation
{
    NSLog(@"Location: %@", newLocation);
    NSLog(@"%f", [newLocation distanceFromLocation:self.location]);
    if ([newLocation distanceFromLocation:self.location] > 15) {
        [self.locationManager stopUpdatingLocation];
        [[UIApplication sharedApplication] cancelLocalNotification:self.localNotification];
        NSLog(@"Alarm REMOVED!");
    }
}


- (void) doneSettingAlarm: (NSDate *) alarmTime andPrepTimeMinutes: (NSString *) prepTimeMinutes andLocation:(CLLocation *)loc
{
    // Save location
    self.location = loc;
    
    [self startLocationMonitor];
    
    NSDateFormatter * dateFormatter = [[NSDateFormatter alloc] init];
    dateFormatter.dateFormat = @"h:mma";
    NSString *dateString = [dateFormatter stringFromDate:alarmTime];
    
    self.displayTimeTextLabel.text = dateString;
    self.alarmStatusTextLabel.text = @"You must leave your house at...";
    self.alarmButton.titleLabel.textAlignment = UITextAlignmentCenter;
    self.alarmButton.titleLabel.text = @"Change";
    
    
    if ([dateString length] == 0) {
        UIAlertView * alert = [[UIAlertView alloc] 
                               initWithTitle:@"Alert"
                               message:@"When do you want to leave your house?"
                               delegate:nil
                               cancelButtonTitle:@"OK"
                               otherButtonTitles:nil];
        
        [alert show];
        return;
    }

    
    if ([prepTimeMinutes length] == 0) {
        UIAlertView * alert = [[UIAlertView alloc] 
                               initWithTitle:@"Alert"
                               message:@"How long will you need to get ready?"
                               delegate:nil
                               cancelButtonTitle:@"OK"
                               otherButtonTitles:nil];
        
        [alert show];
        return;
    }
    
    
    [self setLocalNotificationWithDate:alarmTime];
    [self.navigationController popViewControllerAnimated:YES];
    
}

- (void) setLocalNotificationWithDate: (NSDate *) notificationDate {
    localNotification = [[UILocalNotification alloc] init];
    localNotification.fireDate = notificationDate;
    localNotification.alertBody = @"Time to wake up!";
    localNotification.soundName = UILocalNotificationDefaultSoundName;
    
    [[UIApplication sharedApplication]scheduleLocalNotification:localNotification];
        
}


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{    
    SetAlarmTableViewController *svc = [segue destinationViewController];
    svc.delegate = self;
}

@end
