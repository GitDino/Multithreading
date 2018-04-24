//
//  DOCellModel.m
//  MultithreadDemo
//
//  Created by 魏欣宇 on 2018/4/25.
//  Copyright © 2018年 Dino. All rights reserved.
//

#import "DOCellModel.h"

@implementation DOCellModel

+ (instancetype)cellModelWithTitle:(NSString *) cell_title pushClass:(Class) vc_class
{
    DOCellModel *cell_model = [[DOCellModel alloc] init];
    cell_model.cell_title = cell_title;
    cell_model.vc_class = vc_class;
    return cell_model;
}

@end
