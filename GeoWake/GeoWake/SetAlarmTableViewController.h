//
//  SetAlarmTableViewController.h
//  GeoWake
//
//  Created by Pietro Rea on 4/28/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>
#import "SettingsViewController.h"

@protocol SetAlarmTableViewControllerDelegate;

@interface SetAlarmTableViewController : UITableViewController <SettingsViewControllerDelegate, CLLocationManagerDelegate> 

@property (nonatomic, weak) IBOutlet UILabel *coordinatesLabel;
@property (weak, nonatomic) IBOutlet UILabel *leavingTimeTextLabel;
@property (weak, nonatomic) IBOutlet UIDatePicker *timePicker;
@property (weak, nonatomic) IBOutlet UILabel *prepTimeTextLabel;
@property (strong, nonatomic) CLLocation *location;
@property (weak, nonatomic) id <SetAlarmTableViewControllerDelegate> delegate;


- (IBAction)doneSettingAlarmButton:(id)sender;


- (void)saveLocation:(CLLocation *)location;

@end

@protocol SetAlarmTableViewControllerDelegate <NSObject>

- (void) doneSettingAlarm: (NSDate *) alarmTime andPrepTimeMinutes:(NSString *)prepTimeMinutes andLocation:(CLLocation *)loc; 

@end
