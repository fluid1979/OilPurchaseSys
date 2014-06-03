//
//  MapLocation.m
//  OilPurchase
//
//  Created by 张洋 on 14-6-1.
//  Copyright (c) 2014年 chinawit. All rights reserved.
//

#import "MapLocation.h"


@implementation MapLocation 
-(NSString*)title{
    return @"您的位置";
}
-(NSString *)subtitle{
    
    NSMutableString *ret=[NSMutableString new];
    
    if(_state)
        [ret appendString:_state];
    if(_city)
        [ret appendString:_city];
    if(_state&&_city)
        [ret appendString:@" , "];
    if(_streetAddress&&(_city||_state||_zip))
        [ret appendString:@"."];
    if(_streetAddress)
        [ret appendString:_streetAddress];
    if(_zip)
        [ret appendFormat:@", %@",_zip];
    return ret;
}
@end
