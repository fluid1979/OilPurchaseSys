//
//  MapLocation.h
//  OilPurchase
//
//  Created by 张洋 on 14-6-1.
//  Copyright (c) 2014年 chinawit. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>
@interface MapLocation : NSObject<MKAnnotation>
@property(nonatomic,readwrite)CLLocationCoordinate2D coordinate;
@property(nonatomic,readwrite)NSString *streetAddress;
@property(nonatomic,readwrite)NSString *city;
@property(nonatomic,readwrite)NSString *state;
@property(nonatomic,readwrite)NSString *zip;
@end
