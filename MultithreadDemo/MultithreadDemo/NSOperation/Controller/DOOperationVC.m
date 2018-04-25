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
#import "DOOperation.h"

@interface DOOperationVC ()

@property (nonatomic, strong) DOOperationTableView *operation_tableView;

@property (nonatomic, strong) NSMutableArray *data_array;

/**
 NSOperation中：全局队列
 */
//@property (nonatomic, strong) NSOperationQueue *op_queue;

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
    
    [self configAboutBlock];
}

#pragma mark - Custom Cycle
- (void)configSubViews
{
    [self.view addSubview:self.operation_tableView];
    [self.operation_tableView refreshData:self.data_array];
}

- (void)configAboutBlock
{
    __weak typeof(self) weakSelf = self;
    self.operation_tableView.clickIndexCellBlock = ^(NSIndexPath *indexPath, NSMutableArray *data_array) {
        DOOperationCellModel *cell_model = data_array[indexPath.section][indexPath.row];
        switch (cell_model.type) {
            case OperationTypeInvocation: //NSInvocationOperation
                [weakSelf invocationOperation];
                break;
            case OperationTypeBlock: //NSBlockOperation
                [weakSelf blockOperation];
                break;
            case OperationTypeSubclass: //继承 NSOperation 的子类
                [weakSelf customOperation];
                break;
            case OperationTypeAddExecutionBlock: //addExecutionBlock
                [weakSelf executionBlock];
                break;
            case OperationTypeAddOperation: //addOperation
                [weakSelf addOperation];
                break;
            case OperationTypeAddOperationWithBlock: //addOperationWithBlock
                [weakSelf operationWithBlock];
                break;
            case OperationTypeCommunication: //线程间通信
                [weakSelf threadCommunication];
                break;
            case OperationTypeMaxConcurrent: //最大并发数
                [weakSelf maxConcurrent];
                break;
            case OperationTypeDependency: //操作依赖
                [weakSelf operationDependency];
                break;
                
            default:
                break;
        }
    };
}

#pragma mark - 三种创建方式
- (void)invocationOperation
{
    NSInvocationOperation *invocation_op = [[NSInvocationOperation alloc] initWithTarget:self selector:@selector(invocationOperationFunc:) object:@"NSInvocationOperation"];
    [invocation_op start];
}

- (void)invocationOperationFunc:(id) object
{
    NSLog(@"%@---%@", object, [NSThread currentThread]);
}

- (void)blockOperation
{
    __weak typeof(self) weakSelf = self;
    NSBlockOperation *block_op = [NSBlockOperation blockOperationWithBlock:^{
        [weakSelf blockOperationFunc:@"NSBlockOperation"];
    }];
    [block_op start];
}

- (void)blockOperationFunc:(id) object
{
    NSLog(@"%@---%@", object, [NSThread currentThread]);
}

- (void)customOperation
{
    DOOperation *operation = [[DOOperation alloc] init];
    [operation start];
}

#pragma mark - 其他相关
- (void)executionBlock
{
    NSBlockOperation *block_op = [NSBlockOperation blockOperationWithBlock:^{
        NSLog(@"addExecutionBlock 的使用---%@", [NSThread currentThread]);
    }];
    
    [block_op addExecutionBlock:^{
        NSLog(@"操作一：%@", [NSThread currentThread]);
    }];
    
    [block_op addExecutionBlock:^{
        NSLog(@"操作二：%@", [NSThread currentThread]);
    }];
    
    [block_op addExecutionBlock:^{
        NSLog(@"操作三：%@", [NSThread currentThread]);
    }];
    
    [block_op start];
}

- (void)addOperation
{
    NSOperationQueue *op_queue = [[NSOperationQueue alloc] init];
    
    NSInvocationOperation *invocation_op = [[NSInvocationOperation alloc] initWithTarget:self selector:@selector(addOperationFunc:) object:@"NSInvocationOperation"];
    __weak typeof(self) weakSelf = self;
    NSBlockOperation *block_op = [NSBlockOperation blockOperationWithBlock:^{
        [weakSelf addOperationFunc:@"NSBlockOperation"];
    }];
    
    [op_queue addOperation:invocation_op];
    [op_queue addOperation:block_op];
}

- (void)addOperationFunc:(id) object
{
    NSLog(@"%@---%@", object, [NSThread currentThread]);
}

- (void)operationWithBlock
{
    NSOperationQueue *op_queue = [[NSOperationQueue alloc] init];
    
    [op_queue addOperationWithBlock:^{
        NSLog(@"addOperationWithBlock---%@", [NSThread currentThread]);
    }];
}

- (void)threadCommunication
{
    NSOperationQueue *op_queue = [[NSOperationQueue alloc] init];
    
    [op_queue addOperationWithBlock:^{
        NSLog(@"睡3秒");
        [NSThread sleepForTimeInterval:3.0];
        
        [[NSOperationQueue mainQueue] addOperationWithBlock:^{
            NSLog(@"主线程：%@", [NSThread currentThread]);
        }];
    }];
}

- (void)maxConcurrent
{
    NSOperationQueue *op_queue = [[NSOperationQueue alloc] init];
    
    op_queue.maxConcurrentOperationCount = 2;
    
    [op_queue addOperationWithBlock:^{
        NSLog(@"操作一：%@", [NSThread currentThread]);
//        [NSThread sleepForTimeInterval:3.0];
    }];
    [op_queue addOperationWithBlock:^{
        NSLog(@"操作二：%@", [NSThread currentThread]);
    }];
    [op_queue addOperationWithBlock:^{
        NSLog(@"操作三：%@", [NSThread currentThread]);
    }];
    [op_queue addOperationWithBlock:^{
        NSLog(@"操作四：%@", [NSThread currentThread]);
    }];
}

- (void)operationDependency
{
    NSOperationQueue *op_queue = [[NSOperationQueue alloc] init];
    
    NSBlockOperation *operation1 = [NSBlockOperation blockOperationWithBlock:^{
        NSLog(@"操作一：%@", [NSThread currentThread]);
    }];
    NSBlockOperation *operation2 = [NSBlockOperation blockOperationWithBlock:^{
        NSLog(@"操作二：%@", [NSThread currentThread]);
    }];
    NSBlockOperation *operation3 = [NSBlockOperation blockOperationWithBlock:^{
        NSLog(@"操作三：%@", [NSThread currentThread]);
    }];
    
    [operation2 addDependency:operation1];
    [operation3 addDependency:operation2];
    
    [op_queue addOperation:operation1];
    [op_queue addOperation:operation2];
    [op_queue addOperation:operation3];
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

//- (NSOperationQueue *)op_queue
//{
//    if (!_op_queue)
//    {
//        _op_queue = [[NSOperationQueue alloc] init];
//    }
//    return _op_queue;
//}

@end
