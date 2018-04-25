//
//  DOOperationTableView.m
//  MultithreadDemo
//
//  Created by 魏欣宇 on 2018/4/26.
//  Copyright © 2018年 Dino. All rights reserved.
//

#import "DOOperationTableView.h"
#import "DOOperationSectionHeader.h"
#import "DOOperationCell.h"

@implementation DOOperationTableView

#pragma mark - BaseTableViewProtocol协议方法
- (id)obtainDataWithIndex:(NSIndexPath *)indexPath
{
    return [self obtainDataArray][indexPath.section][indexPath.row];
}


#pragma mark - UITableViewDataSource数据源方法
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView;
{
    return [[self obtainDataArray] count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [[self obtainDataArray][section] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    DOOperationCell *cell = [DOOperationCell operationCellWithTableView:tableView];
    cell.cell_model = [self obtainDataWithIndex:indexPath];
    return cell;
}

#pragma mark - UITableViewDelegate代理方法
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 40;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    DOOperationSectionHeader *section_header = [DOOperationSectionHeader operationSectionHeaderWithTableView:tableView];
    section_header.cell_model = [self obtainDataArray][section][0];
    return section_header;
}

@end
