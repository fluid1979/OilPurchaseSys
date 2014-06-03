//
//  ConvertHelper.m
//  OilPurchase
//
//  Created by 张洋 on 14-6-2.
//  Copyright (c) 2014年 chinawit. All rights reserved.
//

#import "ConvertHelper.h"

@implementation ConvertHelper


////
////NSDate向ＮＳString的转化
////
+(NSDate*) convertDateFromString:(NSString*)uiDate
{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init] ;
    [formatter setDateFormat:@"yyyy年MM月dd日"];
    NSDate *date=[formatter dateFromString:uiDate];
    return date;
}


+(NSString *) convertStringFromDate:(NSDate *)date{
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    
     //zzz表示时区，zzz可以删除，这样返回的日期字符将不包含时区信息。
    
    [dateFormatter setDateFormat:@"yyyy年MM月dd日 HH:mm:ss zzz"];
  
    NSString *destDateString = [dateFormatter stringFromDate:date];
    
    return destDateString;
    
}

@end
