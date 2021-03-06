//
//  DOGCDCell.m
//  MultithreadDemo
//
//  Created by 魏欣宇 on 2018/4/25.
//  Copyright © 2018年 Dino. All rights reserved.
//

#import "DOGCDCell.h"
#import "DOGCDCellModel.h"

@implementation DOGCDCell

#pragma mark - Public Cycle
+ (instancetype)GCDCellWithTableView:(UITableView *) tableView
{
    static NSString *ID = @"DOGCDCell";
    DOGCDCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil)
    {
        cell = [[DOGCDCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    return cell;
}

#pragma mark - Life Cycle
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier])
    {
        self.textLabel.textColor = [UIColor colorWithRed:30 / 255.0 green:144 / 255.0 blue:255 / 255.0 alpha:1.0];
    }
    return self;
}

#pragma mark - Setter Cycle
- (void)setCell_model:(DOGCDCellModel *)cell_model
{
    _cell_model = cell_model;
    
    self.textLabel.text = _cell_model.cell_title;
}

@end
