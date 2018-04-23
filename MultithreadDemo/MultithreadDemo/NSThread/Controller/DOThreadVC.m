//
//  DOThreadVC.m
//  MultithreadDemo
//
//  Created by 魏欣宇 on 2018/4/24.
//  Copyright © 2018年 Dino. All rights reserved.
//

#import "DOThreadVC.h"

@interface DOThreadVC ()

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
    self.view.backgroundColor = [UIColor redColor];
}

@end
