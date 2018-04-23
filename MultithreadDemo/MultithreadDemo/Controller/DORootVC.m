//
//  DORootVC.m
//  MultithreadDemo
//
//  Created by 魏欣宇 on 2018/4/24.
//  Copyright © 2018年 Dino. All rights reserved.
//

#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height

#import "DORootVC.h"
#import "DOTypeListTableView.h"
#import "DOTypeCellModel.h"

@interface DORootVC ()

@property (nonatomic, strong) DOTypeListTableView *list_tableView;

@property (nonatomic, strong) NSMutableArray *data_array;

@end

@implementation DORootVC

#pragma mark - Life Cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"多线程学习";
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self configSubViews];
    
    [self configAboutBlock];
}

#pragma mark - Custom Cycle
- (void)configSubViews
{
    [self.view addSubview:self.list_tableView];
    
    [self.list_tableView refreshData:self.data_array];
}

- (void)configAboutBlock
{
    self.list_tableView.clickIndexCellBlock = ^(NSIndexPath *indexPath, NSMutableArray *data_array) {
        NSLog(@"%@", [data_array[indexPath.row] cell_title]);
    };
}


#pragma mark - Getter Cycle
- (DOTypeListTableView *)list_tableView
{
    if (!_list_tableView)
    {
        _list_tableView = [[DOTypeListTableView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
    }
    return _list_tableView;
}

- (NSMutableArray *)data_array
{
    if (!_data_array)
    {
        DOTypeCellModel *cell_model1 = [DOTypeCellModel typeCellModelWithTitle:@"pthread" pushClass:nil];
        DOTypeCellModel *cell_model2 = [DOTypeCellModel typeCellModelWithTitle:@"NSThread" pushClass:nil];
        DOTypeCellModel *cell_model3 = [DOTypeCellModel typeCellModelWithTitle:@"GCD" pushClass:nil];
        DOTypeCellModel *cell_model4 = [DOTypeCellModel typeCellModelWithTitle:@"NSOperation" pushClass:nil];
        
        NSArray *temp_array = @[cell_model1, cell_model2, cell_model3, cell_model4];
        
        _data_array = [NSMutableArray array];
        [_data_array addObjectsFromArray:temp_array];
    }
    return _data_array;
}

@end
