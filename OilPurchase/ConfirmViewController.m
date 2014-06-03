//
//  ConfirmViewController.m
//  OilPurchase
//
//  Created by 张洋 on 14-6-2.
//  Copyright (c) 2014年 chinawit. All rights reserved.
//

#import "ConfirmViewController.h"

@interface ConfirmViewController ()

@end

@implementation ConfirmViewController

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
    

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)saveAndConfirm:(id)sender {
    
    //向远程服务器发起数据创建的调用
    
    //向本地数据原来写出数据
    RecordDao *rd=[[RecordDao alloc] init];
    if([rd CreateDataBase])
    {
        //将来写到记录交易部分
        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
        [dateFormatter setDateFormat:@"yyyy-MM-dd"];
        
        Record *record=[[Record alloc] init];
        record.Id=@"5";
        record.PurchaseTime=[dateFormatter dateFromString:@"2014-6-2"];
        record.Amount=self.txtAmount.text;
        record.Status=@"未使用";
        record.FaPiaoCategory=self.txtPersonOrCon.text;
        record.FaPiaoTaiTou=self.txtFaPiao.text;
        
        NSLog(@"%d",[rd create:record]);
    }
    else
        NSLog(@"errors");

    
    
    
    
}
@end
