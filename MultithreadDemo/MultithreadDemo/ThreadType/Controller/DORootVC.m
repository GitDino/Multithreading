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

#import "DOpthreadVC.h"
#import "DOThreadVC.h"
#import "DOGCDVC.h"
#import "DORunLoopVC.h"

#import "DOTypeListTableView.h"
#import "DOTypeCellModel.h"

@interface DORootVC ()

@property (nonatomic, strong) DOTypeListTableView *list_tableView;

@property (nonatomic, strong) NSMutableArray *data_array;

@property (nonatomic, strong) UIButton *sleep_btn;

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
    
    [self.view addSubview:self.sleep_btn];
    [self.sleep_btn addTarget:self action:@selector(clickMainThreadBlocking) forControlEvents:UIControlEventTouchUpInside];
}

- (void)configAboutBlock
{
    __weak typeof(self) weakSelf = self;
    self.list_tableView.clickIndexCellBlock = ^(NSIndexPath *indexPath, NSMutableArray *data_array) {
        
        DOTypeCellModel *cell_model = data_array[indexPath.section][indexPath.row];
        UIViewController *push_vc = [[cell_model.vc_class alloc] init];
        [weakSelf.navigationController pushViewController:push_vc animated:YES];
    };
}

#pragma mark - Event Cycle
- (void)clickMainThreadBlocking
{
    for (int i = 0; i < 10000; i++)
    {
        NSLog(@"---%d---%@---", i, [NSThread currentThread]);
    }
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
        DOTypeCellModel *cell_model1 = [DOTypeCellModel typeCellModelWithTitle:@"pthread" pushClass:[DOpthreadVC class]];
        cell_model1.section_title = @"多线程实现方式";
        DOTypeCellModel *cell_model2 = [DOTypeCellModel typeCellModelWithTitle:@"NSThread" pushClass:[DOThreadVC class]];
        DOTypeCellModel *cell_model3 = [DOTypeCellModel typeCellModelWithTitle:@"GCD" pushClass:[DOGCDVC class]];
        DOTypeCellModel *cell_model4 = [DOTypeCellModel typeCellModelWithTitle:@"NSOperation" pushClass:nil];
        DOTypeCellModel *cell_model5 = [DOTypeCellModel typeCellModelWithTitle:@"NSRunLoop相关" pushClass:[DORunLoopVC class]];
        cell_model5.section_title = @"RunLoop";
        
        NSArray *temp_array = @[@[cell_model1, cell_model2, cell_model3, cell_model4], @[cell_model5]];
        
        _data_array = [NSMutableArray array];
        [_data_array addObjectsFromArray:temp_array];
    }
    return _data_array;
}

- (UIButton *)sleep_btn
{
    if (!_sleep_btn)
    {
        _sleep_btn = [[UIButton alloc] initWithFrame:CGRectMake((SCREEN_WIDTH - 100) * 0.5, SCREEN_HEIGHT - 22 - 44, 100, 44)];
        [_sleep_btn setTitle:@"主线程阻塞" forState:UIControlStateNormal];
        [_sleep_btn setTitleColor:[UIColor colorWithRed:30 / 255.0 green:144 / 255.0 blue:255 / 255.0 alpha:1.0] forState:UIControlStateNormal];
    }
    return _sleep_btn;
}

@end
