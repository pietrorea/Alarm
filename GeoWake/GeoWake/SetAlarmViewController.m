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

@implementation SetAlarmViewController
@synthesize alarmDatePicker;
@synthesize morningPrepTextField;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
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
    NSLog(@"The selected date & time is %@", selectedDate);
    
}

- (void)textFieldDidBeginEditing:(UITextField *)textField 
{
    NSLog(@"I began editing!");
}

- (void)textFieldDidEndEditing:(UITextField *)textField
{
    /* resign first responder, hide keyboard, move views */
}
@end
