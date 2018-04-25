//
//  DOOperationSectionHeader.h
//  MultithreadDemo
//
//  Created by 魏欣宇 on 2018/4/26.
//  Copyright © 2018年 Dino. All rights reserved.
//

#import <UIKit/UIKit.h>
@class DOOperationCellModel;

@interface DOOperationSectionHeader : UITableViewHeaderFooterView

@property (nonatomic, strong) DOOperationCellModel *cell_model;

+ (instancetype)operationSectionHeaderWithTableView:(UITableView *) tableView;

@end
