//
//  DORunLoopCell.h
//  MultithreadDemo
//
//  Created by 魏欣宇 on 2018/4/24.
//  Copyright © 2018年 Dino. All rights reserved.
//

#import <UIKit/UIKit.h>
@class DORunLoopCellModel;

@interface DORunLoopCell : UITableViewCell

@property (nonatomic, strong) DORunLoopCellModel *cell_model;

+ (instancetype)runLoopCellWithTableView:(UITableView *) tableView;

@end
