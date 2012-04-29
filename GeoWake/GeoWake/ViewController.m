//
//  ViewController.m
//  GeoWake
//
//  Created by Pietro Rea on 4/28/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

@synthesize displayTimeTextLabel;
@synthesize alarmStatusTextLabel;
@synthesize alarmButton;

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

/*- (void)setAlarmWithTime:(NSString *)alartmTime andPrepTimeMinutes:(NSString *)prepTimeMinutes
{
    self.alarmStatusTextLabel.text = @"You must leave your house at...";
    self.displayTimeTextLabel.text = alartmTime;
    self.alarmButton.titleLabel.textAlignment = UITextAlignmentCenter;
    self.alarmButton.titleLabel.text = @"Change";
    
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
    
    [self.navigationController popViewControllerAnimated:YES];
}

- (void) cancelAlarm
{
    self.alarmStatusTextLabel.text = @"No alarm has been set";
    self.displayTimeTextLabel.text = @"0:00";
    self.alarmButton.titleLabel.text = @"Set Alarm";
    [self.navigationController popViewControllerAnimated:YES];
} */



/*- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    SetAlarmViewController *setAlarmViewController = [segue destinationViewController];
    setAlarmViewController.delegate = self;
}*/

@end
