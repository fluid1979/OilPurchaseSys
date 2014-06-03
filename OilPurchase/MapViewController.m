//
//  MapViewController.m
//  OilPurchase
//
//  Created by 张洋 on 14-6-1.
//  Copyright (c) 2014年 chinawit. All rights reserved.
//

#import "MapViewController.h"

@interface MapViewController ()

@end

@implementation MapViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //打开定位服务
    //初始化定位服务器管理对象
    _locationManager=[[CLLocationManager alloc] init];
    _locationManager.delegate=self;
    _locationManager.desiredAccuracy=kCLLocationAccuracyBest;
    _locationManager.distanceFilter=1000.f;
    
    
    //设置地图类型
    _mapView.mapType=MKMapTypeStandard;
    _mapView.delegate=self;

    self.txtQueryKey.delegate = self;
}


//最好是要加到下面这两个事件中
-(void)viewWillAppear:(BOOL)animated
{
    
    [_locationManager startUpdatingLocation];
    
    //注册键盘出现通知
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector (keyboardDidShow:)
												 name: UIKeyboardDidShowNotification object:nil];
    //注册键盘隐藏通知
	[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector (keyboardDidHide:)
                                                 name: UIKeyboardDidHideNotification object:nil];

    [super viewWillAppear:YES];
    
}
-(void)viewWillDisappear:(BOOL)animated{
    
    [super viewWillDisappear:YES];
    [_locationManager stopUpdatingLocation];
    
    //解除键盘出现通知
    [[NSNotificationCenter defaultCenter] removeObserver:self
                                                    name: UIKeyboardDidShowNotification object:nil];
    //解除键盘隐藏通知
    [[NSNotificationCenter defaultCenter] removeObserver:self
                                                    name: UIKeyboardDidHideNotification object:nil];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void) keyboardDidShow: (NSNotification *)notif {
    
    if(keyboardVisible)
        return;
    
    NSDictionary *info=[notif userInfo];
    NSValue *aValue=[info objectForKey:UIKeyboardFrameEndUserInfoKey];
    CGSize  keyboardSize=[aValue CGRectValue].size;

//    CGRect viewFrame=self.scrollView.frame;
//    viewFrame.size.height-=(keyboardSize.height);
//    self.scrollView.frame=viewFrame;
    
    self.scrollView.contentOffset=CGPointMake(0.0f, keyboardSize.height/2);
    
    //滚动到当前文本框
    CGRect textFieldRect=[self.txtQueryKey frame];
    [self.scrollView scrollRectToVisible:textFieldRect animated:YES];
    
    keyboardVisible=YES;
    
}

-(void) keyboardDidHide: (NSNotification *)notif {
    
//    NSDictionary *info=[notif userInfo];
//    NSValue *aValue=[info objectForKey:UIKeyboardFrameEndUserInfoKey];
//    CGSize  keyboardSize=[aValue CGRectValue].size;
    
//    CGRect viewFrame=self.scrollView.frame;
//    viewFrame.size.height+=(keyboardSize.height);
//    self.scrollView.frame=viewFrame;
    
    self.scrollView.contentOffset=CGPointMake(0.0f, -60);
    
    
    if(!keyboardVisible)
        return;
    
    keyboardVisible=NO;

}


//文本的响应
-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    
    //开定位服务
    
    CLGeocoder *geocoder = [[CLGeocoder alloc] init];
    [geocoder geocodeAddressString:_txtQueryKey.text completionHandler:^(NSArray *placemarks, NSError *error) {

        
        if ([placemarks count] > 0) {
            [_mapView removeAnnotations:_mapView.annotations];
        }
        
        for (int i = 0; i < [placemarks count]; i++) {
            
            CLPlacemark* placemark = placemarks[i];
            
            //调整地图位置和缩放比例
            MKCoordinateRegion viewRegion = MKCoordinateRegionMakeWithDistance(placemark.location.coordinate, 10000, 10000);
            [_mapView setRegion:viewRegion animated:YES];
            
            MapLocation *annotation = [[MapLocation alloc] init];
            annotation.coordinate = placemark.location.coordinate;
            
            [_mapView addAnnotation:annotation];
        }
    }];

    [_txtQueryKey resignFirstResponder];
    return YES;
}

#pragma mark -
#pragma mark Map View Delegate Methods
- (MKAnnotationView *) mapView:(MKMapView *)theMapView viewForAnnotation:(id <MKAnnotation>) annotation {
	
	MKPinAnnotationView *annotationView
	= (MKPinAnnotationView *)[_mapView dequeueReusableAnnotationViewWithIdentifier:@"PIN_ANNOTATION"];
	if(annotationView == nil) {
		annotationView = [[MKPinAnnotationView alloc] initWithAnnotation:annotation
                                                         reuseIdentifier:@"PIN_ANNOTATION"];
	}
    
	annotationView.pinColor = MKPinAnnotationColorPurple;
	annotationView.animatesDrop = YES;
	annotationView.canShowCallout = YES;
	
	return annotationView;
}

- (void)mapView:(MKMapView *)mapView didUpdateUserLocation:(MKUserLocation *)userLocation
{
    _mapView.centerCoordinate = userLocation.location.coordinate;
}

- (void)mapViewDidFailLoadingMap:(MKMapView *)theMapView withError:(NSError *)error {
    NSLog(@"error : %@",[error description]);
}
//
//
////实现定位
//-(void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations{
//    
//    _currLocation=[locations lastObject];
//    //[self setLocationTextField:_currLocation];
//    
//}
//-(void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error{
//    //显示错误或处理错误
//}


@end
