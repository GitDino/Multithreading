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

@interface DOGCDVC ()

@property (nonatomic, strong) DOGCDTableView *GCD_tableView;

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

@end
