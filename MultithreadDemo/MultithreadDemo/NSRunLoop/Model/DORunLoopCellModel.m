//
//  DORunLoopCellModel.m
//  MultithreadDemo
//
//  Created by 魏欣宇 on 2018/4/24.
//  Copyright © 2018年 Dino. All rights reserved.
//

#import "DORunLoopCellModel.h"

@implementation DORunLoopCellModel

+ (instancetype)runLoopCellModelWithTitle:(NSString *) cell_title type:(RunLoopType) type
{
    DORunLoopCellModel *cell_model = [[DORunLoopCellModel alloc] init];
    cell_model.cell_title = cell_title;
    cell_model.type = type;
    return cell_model;
}

@end
