//
//  RecordViewController.h
//  OilPurchase
//
//  Created by 张洋 on 14-6-1.
//  Copyright (c) 2014年 chinawit. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RecordDao.h"
#import "RecordCell.h"
#import "ConvertHelper.h"

@interface RecordViewController : UITableViewController
@property(nonatomic,strong) NSMutableArray *listData;
@end
