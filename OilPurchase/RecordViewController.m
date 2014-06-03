//
//  RecordViewController.m
//  OilPurchase
//
//  Created by 张洋 on 14-6-1.
//  Copyright (c) 2014年 chinawit. All rights reserved.
//

#import "RecordViewController.h"




@interface RecordViewController ()

@end

@implementation RecordViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    RecordDao *rd=[RecordDao sharedManager];
    if([rd CreateDataBase])
    {
      
        self.listData = [rd  findAll];
        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(reloadView:)
                                                     name:@"reloadViewNotification"
                                                   object:nil];
    }
//    else
//        NSLog(@"errors");
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    
    return self.listData.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    RecordCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CellRecord"  forIndexPath:indexPath];
    
    if (cell == nil) {
        cell = [[RecordCell alloc] initWithStyle:UITableViewCellStyleDefault
                                      reuseIdentifier:@"CellRecord" ] ;
    }
    Record  *rd = self.listData[indexPath.row];
    
    cell.amount.text=rd.Amount;

    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy年MM月dd日"];
    
    NSString *destDateString = [dateFormatter stringFromDate:rd.PurchaseTime];

    cell.purchaseTime.text=destDateString;
    cell.status.text = rd.Status;
    
    return cell;
}


#pragma mark - 处理通知
-(void)reloadView:(NSNotification*)notification
{
    NSMutableArray *resList = [notification object];
    self.listData  = resList;
    [self.tableView reloadData];
}



@end
