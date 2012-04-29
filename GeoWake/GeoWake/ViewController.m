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

@interface ViewController ()

@end

@implementation ViewController 

@synthesize displayTimeTextLabel;
@synthesize alarmStatusTextLabel;
@synthesize alarmButton;
@synthesize locationManager;
@synthesize location;

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

- (void) doneSettingAlarm: (NSDate *) alarmTime andPrepTimeMinutes: (NSString *) prepTimeMinutes andLocation:(CLLocation *)loc
{
    self.location = loc;

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
    UILocalNotification *localNotification = [[UILocalNotification alloc] init];
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
