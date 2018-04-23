//
//  DOSimulationVC.m
//  MultithreadDemo
//
//  Created by 魏欣宇 on 2018/4/24.
//  Copyright © 2018年 Dino. All rights reserved.
//

/**
 线程安全问题：当多个线程访问同一块资源时，很容易引发数据错乱和数据安全问题。
 
 1.自旋锁：
 当新线程访问代码时，如果发现有其他线程正在锁定代码，新线程会用死循环的方式，一直等待锁定的代码执行完成。相当于不停尝试执行代码，比较消耗性能。
 
 2.互斥锁（同步锁）：@synchronized(锁对象) {// 需要锁定的代码}
 当新线程访问时，如果发现其他线程正在执行锁定的代码，新线程就会进入休眠。
 */

#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height

#import "DOSimulationVC.h"

@interface DOSimulationVC ()
/**
 剩余票量
 nonatomic：非原子属性（非线程安全），同一时间可以有很多线程 读 和 写，效率高
 atomic   ：原子属性(线程安全)，保证同一时间只有一个线程能够写入（但是同一个时间多个线程都可以取值）
 atomic   ：本身就有一把自旋锁，且只对 写 操作进行加锁，对 读 操作没有限制
 */
@property (nonatomic, assign) NSInteger total_count;

@property (nonatomic, strong) UIButton *sell_btn;

@end

@implementation DOSimulationVC

#pragma mark - Life Cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"模拟售票";
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self configSubViews];
}

#pragma mark - Custom Cycle
- (void)configSubViews
{
    [self.view addSubview:self.sell_btn];
    [self.sell_btn addTarget:self action:@selector(clickStartSellAction:) forControlEvents:UIControlEventTouchUpInside];
}

#pragma mark - Event Cycle
- (void)clickStartSellAction:(UIButton *) btn
{
    self.total_count = 50;
    
    __weak typeof(self) weakSelf = self;
    NSThread *thread_A = [[NSThread alloc] initWithBlock:^{
        [weakSelf sellTicketsFunc:@"售票员A"];
    }];
    thread_A.name = @"售票员A";
    [thread_A start];
    
    NSThread *thread_B = [[NSThread alloc] initWithBlock:^{
        [weakSelf sellTicketsFunc:@"售票员B"];
    }];
    thread_B.name = @"售票员B";
    [thread_B start];
}

- (void)sellTicketsFunc:(NSString *) name
{
    while (YES) {
        
        /**
         互斥锁（同步锁）：保证锁内的代码,同一时间,只有一条线程执行!
         ()：切记不能是局部变量
         */
        @synchronized(self) {
            
            if (self.total_count > 0)
            {
                self.total_count --;
                NSLog(@"剩余：%zd 张 -->%@", self.total_count, name);
            }
            else
            {
                NSLog(@"票已全部出售完毕！%@", name);
                break;
            }
            
        }
        
    }
}

#pragma mark - Getter Cycle
- (UIButton *)sell_btn
{
    if (!_sell_btn)
    {
        _sell_btn = [[UIButton alloc] initWithFrame:CGRectMake((SCREEN_WIDTH - 100) * 0.5, SCREEN_HEIGHT * 0.5 - 22 - 64, 100, 44)];
        [_sell_btn setTitle:@"开始售票" forState:UIControlStateNormal];
        [_sell_btn setTitleColor:[UIColor colorWithRed:30 / 255.0 green:144 / 255.0 blue:255 / 255.0 alpha:1.0] forState:UIControlStateNormal];
    }
    return _sell_btn;
}

@end
