//
//  ConfirmViewController.h
//  OilPurchase
//
//  Created by 张洋 on 14-6-2.
//  Copyright (c) 2014年 chinawit. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RecordDao.h"
#import "RecordCell.h"
#import "ConvertHelper.h"


@interface ConfirmViewController : UIViewController
- (IBAction)saveAndConfirm:(id)sender;
@property (weak, nonatomic) IBOutlet UILabel *txtAmount;
@property (weak, nonatomic) IBOutlet UILabel *txtFaPiao;
@property (weak, nonatomic) IBOutlet UILabel *txtPersonOrCon;

@end
