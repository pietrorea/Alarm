//
//  SettingsViewController.m
//  GeoWake
//
//  Created by Ming Loong Chng on 4/28/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "SettingsViewController.h"

@interface SettingsViewController ()

@end

@implementation SettingsViewController
@synthesize setHomeLocationButton;
@synthesize delegate;

/*
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {

    }
    
    return self;
}
 */

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    // Create location manager object
    locationManager = [[CLLocationManager alloc] init];
    
    
    // Set desired accuracy
    [locationManager setDesiredAccuracy:kCLLocationAccuracyBest];
    
    // Set locationManager delegate
    [locationManager setDelegate:self];
    
    [locationManager startUpdatingLocation];
    
    // Show user location on map
    [worldView setShowsUserLocation:YES];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (void)locationManager:(CLLocationManager *)manager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation
{
    NSLog(@"HEYYYY!");
    
}

- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error
{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Location update failed" message:@"Please try again" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
    [alert show];
}

- (void)mapView:(MKMapView *)mapView didUpdateUserLocation:(MKUserLocation *)userLocation
{
    CLLocationCoordinate2D loc = [userLocation coordinate];
    MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance(loc, 100, 100);
    [worldView setRegion:region animated:YES];

    self.setHomeLocationButton.hidden = NO;
}

- (IBAction)setLocation:(id)sender {
    [self.delegate startMonitoringForLocationChanges:locationManager.location];
    [locationManager stopUpdatingLocation];
}
@end
