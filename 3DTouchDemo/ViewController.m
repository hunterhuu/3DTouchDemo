//
//  ViewController.m
//  3DTouchDemo
//
//  Created by huqi on 2018/8/21.
//  Copyright © 2018年 huqi. All rights reserved.
//

#import "ViewController.h"
#import "TouchTableViewController.h"
#import "WKWebViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIButton *tempButton0 = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 300, 40)];
    tempButton0.center = CGPointMake(self.view.frame.size.width / 2, self.view.frame.size.height / 2 - 40);
    [tempButton0 setTitle:@"3DTouch UIViewController" forState:UIControlStateNormal];
    [tempButton0 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    tempButton0.titleLabel.font = [UIFont systemFontOfSize:20];
    tempButton0.layer.borderWidth = 1;
    tempButton0.layer.borderColor = [UIColor blackColor].CGColor;
    tempButton0.tag = 1000;
    [tempButton0 addTarget:self action:@selector(jumpMethod:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:tempButton0];
    
    UIButton *tempButton1 = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 300, 40)];
    tempButton1.center = CGPointMake(self.view.frame.size.width / 2, self.view.frame.size.height / 2 + 40);
    [tempButton1 setTitle:@"3DTouch WKWebView" forState:UIControlStateNormal];
    [tempButton1 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    tempButton1.titleLabel.font = [UIFont systemFontOfSize:20];
    tempButton1.layer.borderWidth = 1;
    tempButton1.layer.borderColor = [UIColor blackColor].CGColor;
    tempButton1.tag = 1001;
    [tempButton1 addTarget:self action:@selector(jumpMethod:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:tempButton1];
}

- (void)jumpMethod:(UIButton *)button {
    switch (button.tag) {
        case 1000:
            [self showViewController:[[TouchTableViewController alloc] init] sender:self];
            break;
            
        case 1001:
            [self showViewController:[[WKWebViewController alloc] init] sender:self];
            break;
        default:
            break;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
