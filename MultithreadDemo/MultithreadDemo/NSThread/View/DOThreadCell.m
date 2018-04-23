//
//  DOThreadCell.m
//  MultithreadDemo
//
//  Created by 魏欣宇 on 2018/4/24.
//  Copyright © 2018年 Dino. All rights reserved.
//

#import "DOThreadCell.h"

#import "DOThreadCellModel.h"

@implementation DOThreadCell

#pragma mark - Public Cycle
+ (instancetype)threadCellWithTableView:(UITableView *) tableView
{
    static NSString *ID = @"DOThreadCell";
    DOThreadCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil)
    {
        cell = [[DOThreadCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    return cell;
}

#pragma mark - Life Cycle
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier])
    {
        
    }
    return self;
}

#pragma mark - Setter Cycle
- (void)setCell_model:(DOThreadCellModel *)cell_model
{
    _cell_model = cell_model;
    
    self.textLabel.text = _cell_model.cell_title;
}

@end
