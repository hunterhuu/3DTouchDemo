//
//  WKWebViewController.h
//  3DTouchDemo
//
//  Created by huqi on 2018/9/11.
//  Copyright © 2018年 huqi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <WebKit/WebKit.h>

@interface WKWebViewController : UIViewController

@property (nonatomic, strong) NSArray<id<WKPreviewActionItem>> *defaultActions;
@property (nonatomic, copy) NSString *loadURL;
@end
