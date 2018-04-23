//
//  DOpthreadVC.m
//  MultithreadDemo
//
//  Created by 魏欣宇 on 2018/4/24.
//  Copyright © 2018年 Dino. All rights reserved.
//

#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height

#import <pthread.h>
#import "DOpthreadVC.h"

@interface DOpthreadVC ()

@property (nonatomic, strong) UIButton *pthread_btn;

@end

@implementation DOpthreadVC

#pragma mark - Life Cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"pthread学习";
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self configSubViews];
}

#pragma mark - Custom Cycle
- (void)configSubViews
{
    [self.view addSubview:self.pthread_btn];
    [self.pthread_btn addTarget:self action:@selector(clickpthreadAction:) forControlEvents:UIControlEventTouchUpInside];
}

#pragma mark - Event Cycle
- (void)clickpthreadAction:(UIButton *) btn
{
    NSString *param_str = @"pthread的使用";
    pthread_t thread_id;
    
    /**
     1.pthread 是属于 POSIX 多线程开发框架
     
     2.__bridge：原因：自动引用计数无法管理C语言数据
     - 在 ARC 开发中需要
     - 在 MRC 不需要
     */
    int result = pthread_create(&thread_id, NULL, &taskFunc, (__bridge void *)(param_str));
    if (result == 0)
    {
        NSLog(@"---pthread：成功---");
    }
    else
    {
        NSLog(@"---pthread：失败---\nerror %d", result);
    }
}

void *taskFunc(void * param){
    
    NSLog(@"---%@---%@---", [NSThread currentThread], param);
    
    return NULL;
}

#pragma mark - Getter Cycle
- (UIButton *)pthread_btn
{
    if (!_pthread_btn)
    {
        _pthread_btn = [[UIButton alloc] initWithFrame:CGRectMake((SCREEN_WIDTH - 160) * 0.5, (SCREEN_HEIGHT - 44) * 0.5 - 64, 160, 44)];
        [_pthread_btn setTitle:@"pthread开线程方法" forState:UIControlStateNormal];
        [_pthread_btn setTitleColor:[UIColor colorWithRed:30 / 255.0 green:144 / 255.0 blue:255 / 255.0 alpha:1.0] forState:UIControlStateNormal];
    }
    return _pthread_btn;
}

@end
