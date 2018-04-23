//
//  DOTypeListTableView.m
//  MultithreadDemo
//
//  Created by 魏欣宇 on 2018/4/24.
//  Copyright © 2018年 Dino. All rights reserved.
//

#import "DOTypeListTableView.h"
#import "DOTypeListCell.h"

@implementation DOTypeListTableView

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    DOTypeListCell *cell = [DOTypeListCell typeListCellWithTableView:tableView];
    cell.cell_model = [self obtainDataWithIndex:indexPath];
    return cell;
}

@end
