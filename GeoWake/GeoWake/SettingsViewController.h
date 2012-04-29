//
//  SettingsViewController.h
//  GeoWake
//
//  Created by Ming Loong Chng on 4/28/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>
#import <MapKit/MapKit.h>

@protocol SettingsViewControllerDelegate;

@interface SettingsViewController : UIViewController <CLLocationManagerDelegate, MKMapViewDelegate>
{
    CLLocationManager *locationManager;
    
    IBOutlet MKMapView *worldView;
    IBOutlet UIActivityIndicatorView *activityIndicator;
}

@property (weak, nonatomic) IBOutlet UIButton *setHomeLocationButton;
@property (weak, nonatomic) id <SettingsViewControllerDelegate> delegate;
- (IBAction)setLocation:(id)sender;

@end

@protocol SettingsViewControllerDelegate <NSObject>

- (void)saveLocation:(CLLocation *)location;

@end
