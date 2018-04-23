//
//  DOTypeListCell.h
//  MultithreadDemo
//
//  Created by 魏欣宇 on 2018/4/24.
//  Copyright © 2018年 Dino. All rights reserved.
//

#import <UIKit/UIKit.h>
@class DOTypeCellModel;

@interface DOTypeListCell : UITableViewCell

@property (nonatomic, strong) DOTypeCellModel *cell_model;

+ (instancetype)typeListCellWithTableView:(UITableView *) tableView;

@end