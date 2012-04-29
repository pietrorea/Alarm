//
//  SetAlarmViewController.m
//  GeoWake
//
//  Created by Pietro Rea on 4/28/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "SetAlarmViewController.h"

@interface SetAlarmViewController ()

@end

NSDate * selectedAlarmDate;

@implementation SetAlarmViewController
@synthesize alarmDatePicker;
@synthesize morningPrepTextField;
@synthesize delegate;

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    selectedAlarmDate = [NSDate date];
    morningPrepTextField.keyboardType = UIKeyboardTypeNumberPad;
}

- (void)viewDidUnload
{
    [self setAlarmDatePicker:nil];
    [self setMorningPrepTextField:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (IBAction)setAlarmButton:(id)sender {
    
    //Grab the date and time from the DatePicker
    NSDate * selectedDate = [alarmDatePicker date];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    dateFormatter.dateFormat = @"h:mma";
    NSString *dateString = [dateFormatter stringFromDate:selectedDate];
    
    NSLog(@"The selected date & time is %@", dateString);
    
    int prepTimeMinutes = [morningPrepTextField.text intValue];
    NSLog(@"Number of minutes: %i", prepTimeMinutes);
    
    
    [[self delegate] setAlarmWithTime:dateString 
                   andPrepTimeMinutes:morningPrepTextField.text];
    
}

- (IBAction)cancelAlarmButton:(id)sender {
    
    [[self delegate] cancelAlarm];
}

@end
