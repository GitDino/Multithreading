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
    
    [self configAboutBlock];
}

#pragma mark - Custom Cycle
- (void)configSubViews
{
    [self.view addSubview:self.GCD_tableView];
    [self.GCD_tableView refreshData:self.data_array];
}

- (void)configAboutBlock
{
    __weak typeof(self) weakSelf = self;
    self.GCD_tableView.clickIndexCellBlock = ^(NSIndexPath *indexPath, NSMutableArray *data_array) {
        DOGCDCellModel *cell_model = data_array[indexPath.row];
        switch (cell_model.type) {
            case GCDTypeSerialSyn:      //串行同步
                [weakSelf serialSync];
                break;
            case GCDTypeSerialAsyn:     //串行异步
                [weakSelf serialAsync];
                break;
            case GCDTypeConcurrentSyn:  //并发同步
                [weakSelf concurrentSyn];
                break;
            case GCDTypeConcurrentAsyn: //并发异步
                [weakSelf concurrentAsyn];
                break;
            case GCDTypeMainSyn:        //主队列同步
            {
                dispatch_async(dispatch_get_global_queue(0, 0), ^{
                    [weakSelf mainSyn];
                });
            }
                break;
            case GCDTypeMainAsyn:       //主队列同步
                [weakSelf mainAsyn];
                break;
            case GCDTypeOther1:         //GCD线程间通信
                [weakSelf communicationBetweenThread];
                break;
            case GCDTypeOther2:         //GCD队列组
                [weakSelf testGroup];
                break;
            case GCDTypeOther3:         //GCD快速迭代
                [weakSelf applyGCD];
                break;
            case GCDTypeOther4:         //GCD栅栏
                [weakSelf barrierGCD];
                break;
                
            default:
                break;
        }
    };
}

- (void)serialSync
{
    NSLog(@"\n\n**************串行同步***************\n\n");
    
    // 串行队列
    dispatch_queue_t queue = dispatch_queue_create("test", DISPATCH_QUEUE_SERIAL);
    
    // 同步执行
    dispatch_sync(queue, ^{
        for (int i = 0; i < 3; i++) {
            NSLog(@"串行同步1   %@",[NSThread currentThread]);
        }
    });
    dispatch_sync(queue, ^{
        for (int i = 0; i < 3; i++) {
            NSLog(@"串行同步2   %@",[NSThread currentThread]);
        }
    });
    dispatch_sync(queue, ^{
        for (int i = 0; i < 3; i++) {
            NSLog(@"串行同步3   %@",[NSThread currentThread]);
        }
    });
}

- (void)serialAsync
{
    NSLog(@"\n\n**************串行异步***************\n\n");
    
    // 串行队列
    dispatch_queue_t queue = dispatch_queue_create("test", DISPATCH_QUEUE_SERIAL);
    
    // 同步执行
    dispatch_async(queue, ^{
        for (int i = 0; i < 3; i++) {
            NSLog(@"串行异步1   %@",[NSThread currentThread]);
        }
    });
    dispatch_async(queue, ^{
        for (int i = 0; i < 3; i++) {
            NSLog(@"串行异步2   %@",[NSThread currentThread]);
        }
    });
    dispatch_async(queue, ^{
        for (int i = 0; i < 3; i++) {
            NSLog(@"串行异步3   %@",[NSThread currentThread]);
        }
    });
}

- (void)concurrentSyn
{
    NSLog(@"\n\n**************并发同步***************\n\n");
    
    // 并发队列
    dispatch_queue_t queue = dispatch_queue_create("test", DISPATCH_QUEUE_CONCURRENT);
    
    // 同步执行
    dispatch_sync(queue, ^{
        for (int i = 0; i < 3; i++) {
            NSLog(@"并发同步1   %@",[NSThread currentThread]);
        }
    });
    dispatch_sync(queue, ^{
        for (int i = 0; i < 3; i++) {
            NSLog(@"并发同步2   %@",[NSThread currentThread]);
        }
    });
    dispatch_sync(queue, ^{
        for (int i = 0; i < 3; i++) {
            NSLog(@"并发同步3   %@",[NSThread currentThread]);
        }
    });
}

- (void)concurrentAsyn
{
    NSLog(@"\n\n**************并发异步***************\n\n");
    
    // 并发队列
    dispatch_queue_t queue = dispatch_queue_create("test", DISPATCH_QUEUE_CONCURRENT);
    
    // 同步执行
    dispatch_async(queue, ^{
        for (int i = 0; i < 3; i++) {
            NSLog(@"并发异步1   %@",[NSThread currentThread]);
        }
    });
    dispatch_async(queue, ^{
        for (int i = 0; i < 3; i++) {
            NSLog(@"并发异步2   %@",[NSThread currentThread]);
        }
    });
    dispatch_async(queue, ^{
        for (int i = 0; i < 3; i++) {
            NSLog(@"并发异步3   %@",[NSThread currentThread]);
        }
    });
}

//主队列同步，放到主线程会死锁，现在是在新开的一条线程上执行
- (void)mainSyn
{
    NSLog(@"\n\n**************主队列同步***************\n\n");
    
    // 主队列
    dispatch_queue_t queue = dispatch_get_main_queue();
    
    dispatch_sync(queue, ^{
        for (int i = 0; i < 3; i++) {
            NSLog(@"主队列同步1   %@",[NSThread currentThread]);
        }
    });
    dispatch_sync(queue, ^{
        for (int i = 0; i < 3; i++) {
            NSLog(@"主队列同步2   %@",[NSThread currentThread]);
        }
    });
    dispatch_sync(queue, ^{
        for (int i = 0; i < 3; i++) {
            NSLog(@"主队列同步3   %@",[NSThread currentThread]);
        }
    });
}

- (void)mainAsyn
{
    NSLog(@"\n\n**************主队列异步***************\n\n");
    
    // 主队列
    dispatch_queue_t queue = dispatch_get_main_queue();
    
    dispatch_async(queue, ^{
        for (int i = 0; i < 3; i++) {
            NSLog(@"主队列异步1   %@",[NSThread currentThread]);
        }
    });
    dispatch_async(queue, ^{
        for (int i = 0; i < 3; i++) {
            NSLog(@"主队列异步2   %@",[NSThread currentThread]);
        }
    });
    dispatch_async(queue, ^{
        for (int i = 0; i < 3; i++) {
            NSLog(@"主队列异步3   %@",[NSThread currentThread]);
        }
    });
}

- (void)communicationBetweenThread
{
    NSLog(@"\n\n**************线程间通信***************\n\n");
    
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        NSLog(@"这里是一个自线程 %@", [NSThread currentThread]);
        
        dispatch_async(dispatch_get_main_queue(), ^{
            NSLog(@"这里是主线程 %@", [NSThread currentThread]);
        });
    });
}

- (void)testGroup
{
    NSLog(@"\n\n**************队列组***************\n\n");
    
    dispatch_group_t group = dispatch_group_create();
    
    dispatch_group_async(group, dispatch_get_global_queue(0, 0), ^{
        NSLog(@"耗时操作1");
    });
    
    dispatch_group_async(group, dispatch_get_global_queue(0, 0), ^{
        NSLog(@"耗时操作2");
    });
    
    dispatch_group_notify(group, dispatch_get_main_queue(), ^{
        NSLog(@"回到主线程进行相关操作 %@", [NSThread currentThread]);
    });
}

- (void)applyGCD
{
    NSLog(@"\n\n************** GCD快速迭代 ***************\n\n");
    
    // 并发队列
    dispatch_queue_t queue = dispatch_get_global_queue(0, 0);
    
    // dispatch_apply几乎同时遍历多个数字
    dispatch_apply(7, queue, ^(size_t index) {
        NSLog(@"dispatch_apply：%zd======%@",index, [NSThread currentThread]);
    });
}

- (void)barrierGCD
{
    // 并发队列
    dispatch_queue_t queue = dispatch_queue_create("test", DISPATCH_QUEUE_CONCURRENT);
    
    // 异步执行
    dispatch_async(queue, ^{
        NSLog(@"栅栏1   %@",[NSThread currentThread]);
    });
    dispatch_async(queue, ^{
        NSLog(@"栅栏2   %@",[NSThread currentThread]);
    });
    
    dispatch_barrier_async(queue, ^{
        NSLog(@"------------barrier------------%@", [NSThread currentThread]);
    });
    
    dispatch_async(queue, ^{
        NSLog(@"栅栏3   %@",[NSThread currentThread]);
    });
    dispatch_async(queue, ^{
        NSLog(@"栅栏4   %@",[NSThread currentThread]);
    });
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
