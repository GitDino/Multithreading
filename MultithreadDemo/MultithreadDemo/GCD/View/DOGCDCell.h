//
//  DOGCDCell.h
//  MultithreadDemo
//
//  Created by 魏欣宇 on 2018/4/25.
//  Copyright © 2018年 Dino. All rights reserved.
//

#import <UIKit/UIKit.h>
@class DOGCDCellModel;

@interface DOGCDCell : UITableViewCell

@property (nonatomic, strong) DOGCDCellModel *cell_model;

+ (instancetype)GCDCellWithTableView:(UITableView *) tableView;

@end
