//
//  AcountMasterViewController.m
//  OilPurchase
//
//  Created by 张洋 on 14-6-1.
//  Copyright (c) 2014年 chinawit. All rights reserved.
//

#import "AcountMasterViewController.h"

@interface AcountMasterViewController ()

@end

@implementation AcountMasterViewController

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
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(plusComplete:) name:@"plusDoneNotification" object:nil];

}

-(void)plusComplete:(NSNotification *)notification{
    NSDictionary *theData=[notification userInfo];
    self.txtMoney.text=[theData objectForKey:@"money"];
    NSLog(@"okokokokoko");
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

- (IBAction)plusMoney:(id)sender {
    UIStoryboard *mainStoryBoard=[UIStoryboard storyboardWithName:@"Main" bundle:nil];
    UIViewController *plusMoneyViewController=[mainStoryBoard instantiateViewControllerWithIdentifier:@"plusMoneyViewController"];
    plusMoneyViewController.modalTransitionStyle=UIModalTransitionStyleCoverVertical;
    
    [self presentViewController:plusMoneyViewController animated:YES completion:^{
        //code
    }];
    
}
@end
