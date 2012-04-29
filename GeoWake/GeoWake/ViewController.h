//
//  ViewController.h
//  GeoWake
//
//  Created by Pietro Rea on 4/28/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <SetAlarmTableViewControllerDelegate, CLLocationManagerDelegate>

@property (weak, nonatomic) IBOutlet UILabel *displayTimeTextLabel;
@property (weak, nonatomic) IBOutlet UILabel *alarmStatusTextLabel;
@property (weak, nonatomic) IBOutlet UIButton *alarmButton;
@property (strong, nonatomic) CLLocationManager *locationManager;
@property (strong, nonatomic) CLLocation *location;
@property BOOL disableAlarm;

- (void) setLocalNotificationWithDate: (NSDate *) notificationDate;

@end
