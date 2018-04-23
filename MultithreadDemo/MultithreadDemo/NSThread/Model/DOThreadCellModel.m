//
//  DOThreadCellModel.m
//  MultithreadDemo
//
//  Created by 魏欣宇 on 2018/4/24.
//  Copyright © 2018年 Dino. All rights reserved.
//

#import "DOThreadCellModel.h"

@implementation DOThreadCellModel

+ (instancetype)threadCellModelWithTitle:(NSString *) cell_title type:(ThreadCellModelType) type
{
    DOThreadCellModel *cell_model = [[DOThreadCellModel alloc] init];
    cell_model.cell_title = cell_title;
    cell_model.type = type;
    return cell_model;
}

@end
