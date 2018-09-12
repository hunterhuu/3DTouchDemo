//
//  TouchTableViewController.m
//  3DTouchDemo
//
//  Created by huqi on 2018/9/12.
//  Copyright © 2018年 huqi. All rights reserved.
//

#import "TouchTableViewController.h"
#import "PeekAndPopViewController.h"

@interface TouchTableViewController () <UIViewControllerPreviewingDelegate, UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;

@end

@implementation TouchTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Main Page";
    
    self.tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.view addSubview:self.tableView];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellID = @"cellID";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
        [self registerForPreviewingWithDelegate:self sourceView:cell];
    }
    
    cell.textLabel.text = [NSString stringWithFormat:@"section:%ld, row:%ld", indexPath.section, indexPath.row];
    
    return cell;
}

- (nullable UIViewController *)previewingContext:(id <UIViewControllerPreviewing>)previewingContext viewControllerForLocation:(CGPoint)location {
    NSIndexPath *index;
    if ([previewingContext.sourceView isKindOfClass:UITableViewCell.class]) {
        index = [self.tableView indexPathForCell:(UITableViewCell *)previewingContext.sourceView];
    } else {
        index = [NSIndexPath indexPathForRow:0 inSection:0];
    }
    PeekAndPopViewController *popVC = [[PeekAndPopViewController alloc] init];
//        popVC.preferredContentSize = CGSizeMake(0, 200);

    popVC.titleString = [NSString stringWithFormat:@"section = %ld, row = %ld", index.section, index.row];
    return popVC;
}

- (void)previewingContext:(id <UIViewControllerPreviewing>)previewingContext commitViewController:(UIViewController *)viewControllerToCommit {
    [self showViewController:viewControllerToCommit sender:self];
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 10;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 10;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
