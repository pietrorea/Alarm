//
//  SetAlarmViewController.h
//  GeoWake
//
//  Created by Pietro Rea on 4/28/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol SetAlarmViewControllerDelegate;

@interface SetAlarmViewController : UIViewController <UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UIDatePicker *alarmDatePicker;
@property (weak, nonatomic) IBOutlet UITextField *morningPrepTextField;
@property (weak, nonatomic) id <SetAlarmViewControllerDelegate> delegate;

- (IBAction)setAlarmButton:(id)sender;
- (IBAction)cancelAlarmButton:(id)sender;

@end

@protocol SetAlarmViewControllerDelegate <NSObject>

- (void)setAlarmWithTime: (NSString *) alartmTime;

- (void) cancelAlarm;

@end
