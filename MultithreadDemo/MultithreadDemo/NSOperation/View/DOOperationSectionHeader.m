//
//  DOOperationSectionHeader.m
//  MultithreadDemo
//
//  Created by 魏欣宇 on 2018/4/26.
//  Copyright © 2018年 Dino. All rights reserved.
//

#import "DOOperationSectionHeader.h"
#import "DOOperationCellModel.h"

@interface DOOperationSectionHeader ()

@property (nonatomic, strong) UILabel *title_label;

@end

@implementation DOOperationSectionHeader

#pragma mark - Public Cycle
+ (instancetype)operationSectionHeaderWithTableView:(UITableView *) tableView
{
    static NSString *ID = @"DOOperationSectionHeader";
    DOOperationSectionHeader *section_header = [tableView dequeueReusableHeaderFooterViewWithIdentifier:ID];
    if (section_header == nil)
    {
        section_header = [[DOOperationSectionHeader alloc] initWithReuseIdentifier:ID];
    }
    return section_header;
}

#pragma mark - Life Cycle
- (instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithReuseIdentifier:reuseIdentifier])
    {
        _title_label = [[UILabel alloc] initWithFrame:CGRectMake(12, 0, 300, 40)];
        [self.contentView addSubview:_title_label];
    }
    return self;
}

#pragma mark - Setter Cycle
- (void)setCell_model:(DOOperationCellModel *)cell_model
{
    _cell_model = cell_model;
    
    _title_label.text = _cell_model.section_title;
}

@end
