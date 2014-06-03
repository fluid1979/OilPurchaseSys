//
//  AcountMasterViewController.h
//  OilPurchase
//
//  Created by 张洋 on 14-6-1.
//  Copyright (c) 2014年 chinawit. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PlusMoneyViewController.h"

@interface AcountMasterViewController : UIViewController

@property(nonatomic,strong) PlusMoneyViewController *plusMoneyViewController1;

@property (weak, nonatomic) IBOutlet UILabel *txtMoney;

- (IBAction)plusMoney:(id)sender;

@end
