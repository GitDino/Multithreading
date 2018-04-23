//
//  DORunLoopTableView.m
//  MultithreadDemo
//
//  Created by 魏欣宇 on 2018/4/24.
//  Copyright © 2018年 Dino. All rights reserved.
//

#import "DORunLoopTableView.h"
#import "DORunLoopCell.h"

@implementation DORunLoopTableView

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    DORunLoopCell *cell = [DORunLoopCell runLoopCellWithTableView:tableView];
    cell.cell_model = [self obtainDataWithIndex:indexPath];
    return cell;
}

@end
