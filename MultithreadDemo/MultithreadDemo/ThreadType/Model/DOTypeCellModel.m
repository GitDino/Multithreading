//
//  DOTypeCellModel.m
//  MultithreadDemo
//
//  Created by 魏欣宇 on 2018/4/24.
//  Copyright © 2018年 Dino. All rights reserved.
//

#import "DOTypeCellModel.h"

@implementation DOTypeCellModel

+ (instancetype)typeCellModelWithTitle:(NSString *) cell_title pushClass:(Class) vc_class
{
    DOTypeCellModel *cell_model = [[DOTypeCellModel alloc] init];
    cell_model.cell_title = cell_title;
    cell_model.vc_class = vc_class;
    return cell_model;
}

@end
