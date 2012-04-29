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

@interface SetAlarmTableViewController : UITableViewController <SettingsViewControllerDelegate, CLLocationManagerDelegate>


- (void)startMonitoringForLocationChanges:(CLLocation *)location;

@end
