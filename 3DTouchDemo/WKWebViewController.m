//
//  WKWebViewController.m
//  3DTouchDemo
//
//  Created by huqi on 2018/9/11.
//  Copyright © 2018年 huqi. All rights reserved.
//

#import "WKWebViewController.h"

@interface WKWebViewController () <WKNavigationDelegate, WKUIDelegate>

@property (nonatomic, strong) WKWebView* webView;

@end

@implementation WKWebViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.webView = [[WKWebView alloc] initWithFrame:self.view.bounds];
    if (self.loadURL) {
        [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:self.loadURL]]];
    } else {
        [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"https://www.baidu.com"]]];
    }
    self.webView.UIDelegate = self;
    self.webView.navigationDelegate = self;
    self.webView.allowsLinkPreview = YES;
    [self.view addSubview:self.webView];
}

- (BOOL)webView:(WKWebView *)webView shouldPreviewElement:(WKPreviewElementInfo *)elementInfo {
    return YES;
}

- (UIViewController *)webView:(WKWebView *)webView previewingViewControllerForElement:(WKPreviewElementInfo *)elementInfo defaultActions:(NSArray<id<WKPreviewActionItem>> *)previewActions {
    WKWebViewController *popVC = [[WKWebViewController alloc] init];
    popVC.defaultActions = previewActions;
    popVC.loadURL = elementInfo.linkURL.absoluteString;
    return popVC;
}

- (void)webView:(WKWebView *)webView commitPreviewingViewController:(UIViewController *)previewingViewController {
    [self showViewController:previewingViewController sender:self];
}

- (NSArray<id<UIPreviewActionItem>> *)previewActionItems {
    return self.defaultActions;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
