//
//  DOGCDVC.m
//  MultithreadDemo
//
//  Created by 魏欣宇 on 2018/4/25.
//  Copyright © 2018年 Dino. All rights reserved.
//

#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height

#import "DOGCDVC.h"
#import "DOGCDTableView.h"
#import "DOGCDCellModel.h"

@interface DOGCDVC ()

@property (nonatomic, strong) DOGCDTableView *GCD_tableView;

@property (nonatomic, strong) NSMutableArray *data_array;

@end

@implementation DOGCDVC

#pragma mark - Life Cycle
- (void)dealloc
{
    NSLog(@"%s", __FUNCTION__);
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"GCD学习";
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self configSubViews];
}

#pragma mark - Custom Cycle
- (void)configSubViews
{
    [self.view addSubview:self.GCD_tableView];
    [self.GCD_tableView refreshData:self.data_array];
}

#pragma mark - Getter Cycle
- (DOGCDTableView *)GCD_tableView
{
    if (!_GCD_tableView)
    {
        _GCD_tableView = [[DOGCDTableView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
    }
    return _GCD_tableView;
}

- (NSMutableArray *)data_array
{
    if (!_data_array)
    {
        DOGCDCellModel *cell_model1 = [DOGCDCellModel GCDCellModelWithTitle:@"串行同步" type:GCDTypeSerialSyn];
        DOGCDCellModel *cell_model2 = [DOGCDCellModel GCDCellModelWithTitle:@"串行异步" type:GCDTypeSerialAsyn];
        DOGCDCellModel *cell_model3 = [DOGCDCellModel GCDCellModelWithTitle:@"并发同步" type:GCDTypeConcurrentSyn];
        DOGCDCellModel *cell_model4 = [DOGCDCellModel GCDCellModelWithTitle:@"并发异步" type:GCDTypeConcurrentAsyn];
        DOGCDCellModel *cell_model5 = [DOGCDCellModel GCDCellModelWithTitle:@"主队列同步" type:GCDTypeMainSyn];
        DOGCDCellModel *cell_model6 = [DOGCDCellModel GCDCellModelWithTitle:@"主队列异步" type:GCDTypeMainAsyn];
        DOGCDCellModel *cell_model7 = [DOGCDCellModel GCDCellModelWithTitle:@"GCD线程间通信" type:GCDTypeOther1];
        DOGCDCellModel *cell_model8 = [DOGCDCellModel GCDCellModelWithTitle:@"GCD队列组" type:GCDTypeOther2];
        DOGCDCellModel *cell_model9 = [DOGCDCellModel GCDCellModelWithTitle:@"GCD快速迭代" type:GCDTypeOther3];
        DOGCDCellModel *cell_model10 = [DOGCDCellModel GCDCellModelWithTitle:@"GCD栅栏" type:GCDTypeOther4];
        
        NSArray *temp_array = @[cell_model1, cell_model2, cell_model3, cell_model4, cell_model5, cell_model6, cell_model7, cell_model8, cell_model9, cell_model10];
        
        _data_array = [NSMutableArray array];
        [_data_array addObjectsFromArray:temp_array];
    }
    return _data_array;
}

@end
