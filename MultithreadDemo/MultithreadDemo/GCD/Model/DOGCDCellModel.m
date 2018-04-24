//
//  DOGCDCellModel.m
//  MultithreadDemo
//
//  Created by 魏欣宇 on 2018/4/25.
//  Copyright © 2018年 Dino. All rights reserved.
//

#import "DOGCDCellModel.h"

@implementation DOGCDCellModel

+ (instancetype)GCDCellModelWithTitle:(NSString *) cell_title type:(GCDType) type
{
    DOGCDCellModel *cell_model = [[DOGCDCellModel alloc] init];
    cell_model.cell_title = cell_title;
    cell_model.type = type;
    return cell_model;
}

@end
