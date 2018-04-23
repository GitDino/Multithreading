//
//  DORunLoopVC.m
//  MultithreadDemo
//
//  Created by 魏欣宇 on 2018/4/24.
//  Copyright © 2018年 Dino. All rights reserved.
//

#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height

#import "DORunLoopVC.h"
#import "DORunLoopTableView.h"
#import "DORunLoopCellModel.h"

@interface DORunLoopVC ()

@property (nonatomic, strong) DORunLoopTableView *loop_tableView;

@property (nonatomic, strong) NSMutableArray *data_array;

@property (nonatomic, strong) NSTimer *timer;

@property (nonatomic, assign, getter=isFinished) BOOL finished;

@end

@implementation DORunLoopVC

#pragma mark - Life Cycle
- (void)dealloc
{
    NSLog(@"%s", __FUNCTION__);
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"NSRunLoop相关";
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self configSubViews];
    
    [self configAboutBlock];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    
    [self closeTimer];
}

#pragma mark - Custom Cycle
- (void)configSubViews
{
    [self.view addSubview:self.loop_tableView];
    [self.loop_tableView refreshData:self.data_array];
}

- (void)configAboutBlock
{
    __weak typeof(self) weakSelf = self;
    self.loop_tableView.clickIndexCellBlock = ^(NSIndexPath *indexPath, NSMutableArray *data_array) {
        DORunLoopCellModel *cell_model = data_array[indexPath.row];
        switch (cell_model.type) {
            case RunLoopTypeTimer:  //定时器
                [weakSelf createTimer];
                break;
            case RunLoopTypeCustom: //自线程管理RunLoop
                [weakSelf createAboutThreads];
                break;
                
            default:
                break;
        }
    };
}

#pragma mark - 定时器相关方法
- (void)createTimer
{
    self.timer = [NSTimer timerWithTimeInterval:1.0 target:self selector:@selector(updateTimer) userInfo:nil repeats:YES];
    [[NSRunLoop currentRunLoop] addTimer:self.timer forMode:NSRunLoopCommonModes];
}

- (void)closeTimer
{
    [self.timer invalidate];
    self.timer = nil;
}

/**
 注意：此方法若执行特别耗时的操作，就会导致UI卡顿
 */
- (void)updateTimer
{
    static NSInteger num = 0;
    
    NSLog(@"---%zd\n%@", num ++, [NSThread currentThread]);
}

#pragma mark - 同一子线程执行多个方法
- (void)createAboutThreads
{
    __weak typeof(self) weakSelf = self;
    NSThread *thread = [[NSThread alloc] initWithBlock:^{
        [weakSelf doSomething1];
    }];
    [thread start];
    
    self.finished = NO;
    
    [self performSelector:@selector(doSomething2) onThread:thread withObject:nil waitUntilDone:NO];
}

/**
 注意：子线程的RunLoop默认处于不开启状态
 自己不写循环，若doSomething1方法很简单，在此方法执行完，该线程释放，doSomething2不会执行
 [[NSRunLoop currentRunLoop] run] 不能使用此方法开启子线程的runLoop，导致开启后的代码不执行
 */
- (void)doSomething1
{
    NSLog(@"doSomething1：%@", [NSThread currentThread]);
    
//    [[NSRunLoop currentRunLoop] run];
    
    while (!self.isFinished) {
        [[NSRunLoop currentRunLoop] runMode:NSDefaultRunLoopMode beforeDate:[NSDate dateWithTimeIntervalSinceNow:0.1]];
    }
    
    NSLog(@"这里执行了吗？");
}

- (void)doSomething2
{
    NSLog(@"doSomething2：%@", [NSThread currentThread]);
    self.finished = YES;
}


#pragma mark - Getter Cycle
- (DORunLoopTableView *)loop_tableView
{
    if (!_loop_tableView)
    {
        _loop_tableView = [[DORunLoopTableView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
    }
    return _loop_tableView;
}

- (NSMutableArray *)data_array
{
    if (!_data_array)
    {
        DORunLoopCellModel *cell_model1 = [DORunLoopCellModel runLoopCellModelWithTitle:@"开启定时器" type:RunLoopTypeTimer];
        DORunLoopCellModel *cell_model2 = [DORunLoopCellModel runLoopCellModelWithTitle:@"同一子线程执行多个方法" type:RunLoopTypeCustom];
        
        NSArray *temp_array = @[cell_model1, cell_model2];
        
        _data_array = [NSMutableArray array];
        [_data_array addObjectsFromArray:temp_array];
    }
    return _data_array;
}

@end
