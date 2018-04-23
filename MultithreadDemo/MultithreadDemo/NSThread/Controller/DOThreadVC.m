//
//  DOThreadVC.m
//  MultithreadDemo
//
//  Created by 魏欣宇 on 2018/4/24.
//  Copyright © 2018年 Dino. All rights reserved.
//

#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height

#import "DOThreadVC.h"
#import "DOThreadTableView.h"
#import "DOThreadCellModel.h"

@interface DOThreadVC ()

@property (nonatomic, strong) DOThreadTableView *thread_tableView;

@property (nonatomic, strong) NSMutableArray *data_array;

@end

@implementation DOThreadVC

#pragma mark - Life Cycle
- (void)dealloc
{
    NSLog(@"%s", __FUNCTION__);
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"NSThread学习";
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self configSubViews];
}

#pragma mark - Custom Cycle
- (void)configSubViews
{
    [self.view addSubview:self.thread_tableView];
    [self.thread_tableView refreshData:self.data_array];
}

#pragma mark - Getter Cycle
- (DOThreadTableView *)thread_tableView
{
    if (!_thread_tableView)
    {
        _thread_tableView = [[DOThreadTableView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
    }
    return _thread_tableView;
}

- (NSMutableArray *)data_array
{
    if (!_data_array)
    {
        DOThreadCellModel *cell_model1 = [DOThreadCellModel threadCellModelWithTitle:@"NSThread开线程 方法一" type:ThreadCellModelTypeManual];
        DOThreadCellModel *cell_model2 = [DOThreadCellModel threadCellModelWithTitle:@"NSThread开线程 方法二" type:ThreadCellModelTypeAutomatic];
        DOThreadCellModel *cell_model3 = [DOThreadCellModel threadCellModelWithTitle:@"NSThread开线程 方法三" type:ThreadCellModelTypeImplicit];
        
        NSArray *temp_array = @[cell_model1, cell_model2, cell_model3];
        
        _data_array = [NSMutableArray array];
        [_data_array addObjectsFromArray:temp_array];
    }
    return _data_array;
}

@end
