//
//  PlusMoneyViewController.m
//  OilPurchase
//
//  Created by 张洋 on 14-6-1.
//  Copyright (c) 2014年 chinawit. All rights reserved.
//

#import "PlusMoneyViewController.h"

@interface PlusMoneyViewController ()

@end

@implementation PlusMoneyViewController

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

- (IBAction)done:(id)sender {
    
    [self dismissViewControllerAnimated:YES completion:^{
        
    NSDictionary *dataDict=[NSDictionary dictionaryWithObject:@"999" forKey:@"money"];
        
    [[NSNotificationCenter defaultCenter] postNotificationName:@"plusDoneNotification" object:nil userInfo:dataDict];
    }];
    
    
   
}
@end
