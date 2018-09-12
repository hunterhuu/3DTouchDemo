//
//  PeekAndPopViewController.m
//  3DTouchDemo
//
//  Created by huqi on 2018/9/7.
//  Copyright © 2018年 huqi. All rights reserved.
//

#import "PeekAndPopViewController.h"

@interface PeekAndPopViewController ()

@end

@implementation PeekAndPopViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    UILabel *titleLable = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 300, 50)];
    if (self.titleString) {
        titleLable.text = self.titleString;
    } else {
        titleLable.text = @"Peek And Pop";
    }
    titleLable.textAlignment = NSTextAlignmentCenter;
    titleLable.font = [UIFont systemFontOfSize:20];
    titleLable.center = CGPointMake(self.view.frame.size.width / 2, self.view.frame.size.height / 2);
    [self.view addSubview:titleLable];
    
}

- (NSArray<id<UIPreviewActionItem>> *)previewActionItems {
    UIPreviewAction *preViewAction0 = [UIPreviewAction actionWithTitle:@"preViewAction0" style:(UIPreviewActionStyleDefault) handler:^(UIPreviewAction * _Nonnull action, UIViewController * _Nonnull previewViewController) {
        NSLog(@"preViewAction1_UIPreviewActionStyleDefault");
    }];
    UIPreviewAction *preViewAction1 = [UIPreviewAction actionWithTitle:@"preViewAction1" style:(UIPreviewActionStyleSelected) handler:^(UIPreviewAction * _Nonnull action, UIViewController * _Nonnull previewViewController) {
        NSLog(@"preViewAction2_UIPreviewActionStyleSelected");
    }];
    UIPreviewAction *preViewAction2 = [UIPreviewAction actionWithTitle:@"preViewAction2" style:(UIPreviewActionStyleDestructive) handler:^(UIPreviewAction * _Nonnull action, UIViewController * _Nonnull previewViewController) {
        NSLog(@"preViewAction3_UIPreviewActionStyleDestructive");
    }];
    
    UIPreviewActionGroup *preViewGroup = [UIPreviewActionGroup actionGroupWithTitle:@"preViewGroup" style:UIPreviewActionStyleDestructive actions:@[preViewAction1, preViewAction2]];
    return @[preViewAction0, preViewGroup];
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
