//
//  MapViewController.h
//  OilPurchase
//
//  Created by 张洋 on 14-6-1.
//  Copyright (c) 2014年 chinawit. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>
#import <corelocation/CLLocationManagerDelegate.h>

#import <MapKit/MapKit.h>
#import "MapLocation.h"


@interface MapViewController : UIViewController <UITextFieldDelegate,CLLocationManagerDelegate,MKMapViewDelegate>
{
    BOOL keyboardVisible;
}

@property(nonatomic,strong)CLLocationManager *locationManager;
@property(nonatomic,strong)CLLocation *currLocation;

@property(nonatomic,weak) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UITextField *txtQueryKey;

@property (weak, nonatomic) IBOutlet MKMapView *mapView;
@property(nonatomic,strong)CLPlacemark *currPlaceMark;

@end
