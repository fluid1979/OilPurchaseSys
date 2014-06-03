//
//  PurchasOilViewController.m
//  OilPurchase
//
//  Created by 张洋 on 14-6-2.
//  Copyright (c) 2014年 chinawit. All rights reserved.
//

#import "PurchasOilViewController.h"

@interface PurchasOilViewController ()

@end

@implementation PurchasOilViewController

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
    
    self.txtFaPiao.delegate=self;
    self.txtAmount.delegate=self;
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



//最好是要加到下面这两个事件中
-(void)viewWillAppear:(BOOL)animated
{


    //注册键盘出现通知
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector (keyboardDidShow:)
												 name: UIKeyboardDidShowNotification object:nil];
    //注册键盘隐藏通知
	[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector (keyboardDidHide:)
                                                 name: UIKeyboardDidHideNotification object:nil];

    [super viewWillAppear:YES];

}
-(void)viewWillDisappear:(BOOL)animated{

    [super viewWillDisappear:YES];

    //解除键盘出现通知
    [[NSNotificationCenter defaultCenter] removeObserver:self
                                                    name: UIKeyboardDidShowNotification object:nil];
    //解除键盘隐藏通知
    [[NSNotificationCenter defaultCenter] removeObserver:self
                                                    name: UIKeyboardDidHideNotification object:nil];

}

-(void) keyboardDidShow: (NSNotification *)notif {

    if(keyboardVisible)
        return;

    

    keyboardVisible=YES;

}

-(void) keyboardDidHide: (NSNotification *)notif {



    if(!keyboardVisible)
        return;

    keyboardVisible=NO;

}

//文本的响应
-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    
    [textField resignFirstResponder];
    return YES;
}

- (IBAction)confirmPurchase:(id)sender {
}
@end
