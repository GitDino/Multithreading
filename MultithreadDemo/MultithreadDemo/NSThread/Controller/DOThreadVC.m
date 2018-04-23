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
    
    [self configAboutBlock];
}

#pragma mark - Custom Cycle
- (void)configSubViews
{
    [self.view addSubview:self.thread_tableView];
    [self.thread_tableView refreshData:self.data_array];
}

- (void)configAboutBlock
{
    __weak typeof(self) weakSelf = self;
    self.thread_tableView.clickIndexCellBlock = ^(NSIndexPath *indexPath, NSMutableArray *data_array) {
        DOThreadCellModel *cell_model = data_array[indexPath.row];
        switch (cell_model.type) {
            case ThreadCellModelTypeManual:    //需调用 start 手动开启线程
                [weakSelf createNSThread1];
                break;
            case ThreadCellModelTypeAutomatic: //创建完线程直接开启
                [weakSelf createNSThread2];
                break;
            case ThreadCellModelTypeImplicit:  //隐式创建，直接启动
                [weakSelf createNSThread3];
                break;
                
            default:
                break;
        }
    };
}

#pragma mark - 创建线程相关方法
- (void)createNSThread1
{
    NSThread *thread = [[NSThread alloc] initWithTarget:self selector:@selector(doSomething:) object:@"NSThread01"];
    [thread start];
    
//    NSThread *thread = [[NSThread alloc] initWithBlock:^{
//
//    }];
}

- (void)createNSThread2
{
    [NSThread detachNewThreadSelector:@selector(doSomething:) toTarget:self withObject:@"NSThread02"];
//    [NSThread detachNewThreadWithBlock:^{
//
//    }];
}

- (void)createNSThread3
{
    [self performSelectorInBackground:@selector(doSomething:) withObject:@"NSThread03"];
}

- (void)doSomething:(NSString *) object_str
{
    NSLog(@"参数：%@， 线程：%@", object_str, [NSThread currentThread]);
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
