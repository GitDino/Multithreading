//
//  DOGCDTableView.m
//  MultithreadDemo
//
//  Created by 魏欣宇 on 2018/4/25.
//  Copyright © 2018年 Dino. All rights reserved.
//

#import "DOGCDTableView.h"
#import "DOGCDCell.h"

@implementation DOGCDTableView

#pragma mark - BaseTableViewProtocol协议方法
#pragma mark - UITableViewDataSource数据源方法
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    DOGCDCell *cell = [DOGCDCell GCDCellWithTableView:tableView];
    return cell;
}

#pragma mark - UITableViewDelegate代理方法

@end
