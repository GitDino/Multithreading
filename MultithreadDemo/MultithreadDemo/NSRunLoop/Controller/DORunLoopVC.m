//
//  DORunLoopVC.m
//  MultithreadDemo
//
//  Created by 魏欣宇 on 2018/4/24.
//  Copyright © 2018年 Dino. All rights reserved.
//

#import "DORunLoopVC.h"

@interface DORunLoopVC ()

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
    self.view.backgroundColor = [UIColor redColor];
}

@end
