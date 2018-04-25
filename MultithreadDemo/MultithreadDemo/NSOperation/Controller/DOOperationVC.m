//
//  DOOperationVC.m
//  MultithreadDemo
//
//  Created by 魏欣宇 on 2018/4/26.
//  Copyright © 2018年 Dino. All rights reserved.
//

#import "DOOperationVC.h"

@interface DOOperationVC ()

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
    self.view.backgroundColor = [UIColor redColor];
}

@end
