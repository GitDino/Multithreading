//
//  DOTypeListCell.m
//  MultithreadDemo
//
//  Created by 魏欣宇 on 2018/4/24.
//  Copyright © 2018年 Dino. All rights reserved.
//

#import "DOTypeListCell.h"

#import "DOTypeCellModel.h"

@implementation DOTypeListCell

#pragma mark - Public Cycle
+ (instancetype)typeListCellWithTableView:(UITableView *) tableView
{
    static NSString *ID = @"DOTypeListCell";
    DOTypeListCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil)
    {
        cell = [[DOTypeListCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    return cell;
}

#pragma mark - Life Cycle
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]){}
    return self;
}

#pragma mark - Setter Cycle
- (void)setCell_model:(DOTypeCellModel *)cell_model
{
    _cell_model = cell_model;
    
    self.textLabel.text = _cell_model.cell_title;
}

@end
