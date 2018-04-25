//
//  DOOperationCellModel.m
//  MultithreadDemo
//
//  Created by 魏欣宇 on 2018/4/26.
//  Copyright © 2018年 Dino. All rights reserved.
//

#import "DOOperationCellModel.h"

@implementation DOOperationCellModel

+ (instancetype)operationCellModelWithTitle:(NSString *) cell_title type:(OperationType) type
{
    DOOperationCellModel *cell_model = [[DOOperationCellModel alloc] init];
    cell_model.cell_title = cell_title;
    cell_model.type = type;
    return cell_model;
}

@end
