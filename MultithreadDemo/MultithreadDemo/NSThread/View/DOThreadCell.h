//
//  DOThreadCell.h
//  MultithreadDemo
//
//  Created by 魏欣宇 on 2018/4/24.
//  Copyright © 2018年 Dino. All rights reserved.
//

#import <UIKit/UIKit.h>
@class DOThreadCellModel;

@interface DOThreadCell : UITableViewCell

@property (nonatomic, strong) DOThreadCellModel *cell_model;

+ (instancetype)threadCellWithTableView:(UITableView *) tableView;

@end
