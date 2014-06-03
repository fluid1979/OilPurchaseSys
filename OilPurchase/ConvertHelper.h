//
//  ConvertHelper.h
//  OilPurchase
//
//  Created by 张洋 on 14-6-2.
//  Copyright (c) 2014年 chinawit. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ConvertHelper : NSObject

////
////ＮＳString向NSDate的转化
////
+(NSDate *) convertDateFromString:(NSString*)uiDate;

////
////NSDate向ＮＳString的转化
////
+(NSString *) convertStringFromDate:(NSDate *)date;

@end
