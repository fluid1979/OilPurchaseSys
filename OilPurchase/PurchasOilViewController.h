//
//  PurchasOilViewController.h
//  OilPurchase
//
//  Created by 张洋 on 14-6-2.
//  Copyright (c) 2014年 chinawit. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PurchasOilViewController : UIViewController<UITextFieldDelegate>
{
    BOOL keyboardVisible;
}
@property (weak, nonatomic) IBOutlet UITextField *txtAmount;
@property (weak, nonatomic) IBOutlet UITextField *txtFaPiao;
- (IBAction)confirmPurchase:(id)sender;

@end
