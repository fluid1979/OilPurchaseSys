//
//  Record.h
//  OilPurchase
//
//  Created by 张洋 on 14-6-1.
//  Copyright (c) 2014年 chinawit. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Record : NSObject
@property (nonatomic ,strong) NSString *Id;
@property (nonatomic ,strong) NSDate *PurchaseTime;
@property (nonatomic ,strong) NSString *Amount;
@property (nonatomic ,strong) NSString *Status;
@property (nonatomic ,strong) NSString *FaPiaoCategory;
@property (nonatomic ,strong) NSString *FaPiaoTaiTou;
@end
