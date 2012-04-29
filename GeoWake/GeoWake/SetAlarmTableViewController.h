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

@interface SetAlarmTableViewController : UITableViewController <SettingsViewControllerDelegate, CLLocationManagerDelegate> {
    
}

@property (nonatomic, weak) IBOutlet UILabel *coordinatesLabel;
@property (weak, nonatomic) IBOutlet UILabel *leavingTimeTextLabel;
@property (weak, nonatomic) IBOutlet UITableViewCell *prepTimeTextLabel;
@property (weak, nonatomic) IBOutlet UIDatePicker *timePicker;


- (void)startMonitoringForLocationChanges:(CLLocation *)location;

@end
