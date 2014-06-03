//
//  OilPurchaseTests.m
//  OilPurchaseTests
//
//  Created by 张洋 on 14-5-29.
//  Copyright (c) 2014年 chinawit. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <OCMock/OCMock.h>
#import "ViewController.h"

@interface OilPurchaseTests : XCTestCase
@property (nonatomic,strong) id txtField;
@property (nonatomic,strong) id label;
@property(nonatomic,strong) ViewController *vc;
@end

@implementation OilPurchaseTests

- (void)setUp
{
    [super setUp];
    _txtField=(id)[OCMockObject mockForClass:[UITextField class]];
    _label=(id)[OCMockObject mockForClass:[UILabel class]];
    
    
    _vc=[[ViewController alloc] init];
    
    [_vc setValue:_txtField forKey:@"txtRevenue"];
    [_vc setValue:_label forKey:@"label"];
    
}

- (void)tearDown
{
    [_txtField verify];
    [_label verify];
    self.vc=nil;
    [super tearDown];
}

- (void)testExample
{
    //[[[_txtField stub] andReturn:@"5000"] text];
    //[[_txtField expect] resignFirstResponder];
    //[[_label expect] setText:@"45.00"];
    //[_vc onclick:OCMOCK_ANY];
}

@end
