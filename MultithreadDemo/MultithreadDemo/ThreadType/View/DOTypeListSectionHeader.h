//
//  DOTypeListSectionHeader.h
//  MultithreadDemo
//
//  Created by 魏欣宇 on 2018/4/25.
//  Copyright © 2018年 Dino. All rights reserved.
//

#import <UIKit/UIKit.h>
@class DOTypeCellModel;

@interface DOTypeListSectionHeader : UITableViewHeaderFooterView

@property (nonatomic, strong) DOTypeCellModel *cell_model;

+ (instancetype)typeListSectionHeaderWithTableView:(UITableView *) tableView;

@end
