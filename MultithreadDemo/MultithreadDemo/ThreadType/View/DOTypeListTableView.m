//
//  DOTypeListTableView.m
//  MultithreadDemo
//
//  Created by 魏欣宇 on 2018/4/24.
//  Copyright © 2018年 Dino. All rights reserved.
//

#import "DOTypeListTableView.h"
#import "DOTypeListSectionHeader.h"
#import "DOTypeListCell.h"

@implementation DOTypeListTableView

#pragma mark - BaseTableViewProtocol协议方法
- (id)obtainDataWithIndex:(NSIndexPath *)indexPath
{
    NSArray *data_array = [self obtainDataArray];
    return data_array[indexPath.section][indexPath.row];
}

#pragma mark - UITableViewDataSource数据源方法
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return [[self obtainDataArray] count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSArray *data_array = [self obtainDataArray];
    return [data_array[section] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    DOTypeListCell *cell = [DOTypeListCell typeListCellWithTableView:tableView];
    cell.cell_model = [self obtainDataWithIndex:indexPath];
    return cell;
}

#pragma mark - UITableViewDelegate代理方法
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    DOTypeListSectionHeader *section_header = [DOTypeListSectionHeader typeListSectionHeaderWithTableView:tableView];
    section_header.cell_model = [self obtainDataArray][section][0];
    return section_header;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 40.0;
}

@end
