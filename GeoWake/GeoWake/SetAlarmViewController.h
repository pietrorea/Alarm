//
//  SetAlarmViewController.h
//  GeoWake
//
//  Created by Pietro Rea on 4/28/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SetAlarmViewController : UIViewController <UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UIDatePicker *alarmDatePicker;
@property (weak, nonatomic) IBOutlet UITextField *morningPrepTextField;
- (IBAction)setAlarmButton:(id)sender;

@end
