//
//  MainViewController.m
//  LineTimeDemo
//
//  Created by LHWen on 2019/12/19.
//  Copyright © 2019 LHWen. All rights reserved.
//

#import "MainViewController.h"
#import "LineTimeTableViewCell.h"
#import "LineTimeMode.h"

@interface MainViewController () <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSArray *dataArr;

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"LineTime";
    self.view.backgroundColor = UIColor.whiteColor;
    
    _dataArr = [[[LineTimeMode alloc] init] p_initArray];
    
    _tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.backgroundColor = [UIColor whiteColor];
    _tableView.estimatedRowHeight = 0;
    _tableView.estimatedSectionHeaderHeight = 0;
    _tableView.estimatedSectionFooterHeight = 0;
    if (@available(iOS 11.0, *)) {
        /* 使用以下方法关闭安全区域使用，将会被导航栏遮挡 */
//        _tableView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
    }
    _tableView.tableFooterView = [[UIView alloc] init];
    //        _tableView.separatorColor = kLineViewColor;
    //        _tableView.separatorInset = UIEdgeInsetsMake(0, 0, 0, 0);
    _tableView.showsVerticalScrollIndicator = NO;
    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [_tableView registerClass:[LineTimeTableViewCell class] forCellReuseIdentifier:@"LineTimeCell"];
    [self.view addSubview:_tableView];
    [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _dataArr.count;
}

- (UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    LineTimeTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"LineTimeCell"];
    LineTimeMode *model = _dataArr[indexPath.row];
    cell.nextType = model.nextType;
    cell.nowType = model.nowType;
    cell.nodeDateLbl.text = model.nodeTime;
    cell.contentLbl.text = model.contentStr;
    cell.durationLbl.text = model.durationTime;
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    LineTimeMode *model = _dataArr[indexPath.row];
    return model.rowHeight;
}

@end
