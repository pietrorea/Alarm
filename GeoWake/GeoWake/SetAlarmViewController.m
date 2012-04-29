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

/* Store original center point */
CGPoint originalCenter;

@implementation SetAlarmViewController
@synthesize alarmDatePicker;
@synthesize morningPrepTextField;
@synthesize delegate;

//- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
//    
//    UIViewController *vc = segue.destinationViewController;
//    vc.hidesBottomBarWhenPushed = YES;
//    
//}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    originalCenter = self.view.center;
    morningPrepTextField.keyboardType = UIKeyboardTypeNumberPad;
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

- (void)textFieldDidBeginEditing:(UITextField *)textField 
{
    
    /* I need to fix the offset & timing */
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:0.35];
    self.view.center = CGPointMake(originalCenter.x, originalCenter.y - 216);
    [UIView commitAnimations];
}

- (void)textFieldDidEndEditing:(UITextField *)textField
{
    
    /* I need to fix the offset & timinh */
    [textField resignFirstResponder];
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:0.20];
    self.view.center = CGPointMake(originalCenter.x, originalCenter.y - 68);
    [UIView commitAnimations];
}

- (BOOL) textFieldShouldReturn: (UITextField *) textField
{
    [textField resignFirstResponder];
    return YES;
}

@end
