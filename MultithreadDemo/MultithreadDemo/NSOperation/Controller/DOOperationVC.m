//
//  DOOperationVC.m
//  MultithreadDemo
//
//  Created by 魏欣宇 on 2018/4/26.
//  Copyright © 2018年 Dino. All rights reserved.
//

#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height

#import "DOOperationVC.h"
#import "DOOperationTableView.h"
#import "DOOperationCellModel.h"

@interface DOOperationVC ()

@property (nonatomic, strong) DOOperationTableView *operation_tableView;

@property (nonatomic, strong) NSMutableArray *data_array;

@end

@implementation DOOperationVC

#pragma mark - Life Cycle
- (void)dealloc
{
    NSLog(@"%s", __FUNCTION__);
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"NSOperation学习";
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self configSubViews];
}

#pragma mark - Custom Cycle
- (void)configSubViews
{
    [self.view addSubview:self.operation_tableView];
    [self.operation_tableView refreshData:self.data_array];
}

#pragma mark - Getter Cycle
- (DOOperationTableView *)operation_tableView
{
    if (!_operation_tableView)
    {
        _operation_tableView = [[DOOperationTableView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
    }
    return _operation_tableView;
}

- (NSMutableArray *)data_array
{
    if (!_data_array)
    {
        DOOperationCellModel *cell_model1 = [DOOperationCellModel operationCellModelWithTitle:@"NSInvocationOperation 的使用" type:OperationTypeInvocation];
        cell_model1.section_title = @"NSOperation的三种创建方式";
        DOOperationCellModel *cell_model2 = [DOOperationCellModel operationCellModelWithTitle:@"NSBlockOperation 的使用" type:OperationTypeBlock];
        DOOperationCellModel *cell_model3 = [DOOperationCellModel operationCellModelWithTitle:@"继承 NSOperation 的子类" type:OperationTypeSubclass];
        DOOperationCellModel *cell_model4 = [DOOperationCellModel operationCellModelWithTitle:@"addExecutionBlock 实现多线程" type:OperationTypeAddExecutionBlock];
        cell_model4.section_title = @"NSOperation其他相关";
        DOOperationCellModel *cell_model5 = [DOOperationCellModel operationCellModelWithTitle:@"将操作添加到队列 addOperation" type:OperationTypeAddOperation];
        DOOperationCellModel *cell_model6 = [DOOperationCellModel operationCellModelWithTitle:@"将操作添加到队列 addOperationWithBlock" type:OperationTypeAddOperationWithBlock];
        DOOperationCellModel *cell_model7 = [DOOperationCellModel operationCellModelWithTitle:@"线程间通信" type:OperationTypeCommunication];
        DOOperationCellModel *cell_model8 = [DOOperationCellModel operationCellModelWithTitle:@"最大并发数" type:OperationTypeMaxConcurrent];
        DOOperationCellModel *cell_model9 = [DOOperationCellModel operationCellModelWithTitle:@"操作的依赖关系" type:OperationTypeDependency];
        
        NSArray *temp_array = @[@[cell_model1, cell_model2, cell_model3], @[cell_model4, cell_model5, cell_model6, cell_model7, cell_model8, cell_model9]];
        
        _data_array = [NSMutableArray array];
        [_data_array addObjectsFromArray:temp_array];
    }
    return _data_array;
}

@end
