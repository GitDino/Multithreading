//
//  DOGCDVC.m
//  MultithreadDemo
//
//  Created by 魏欣宇 on 2018/4/25.
//  Copyright © 2018年 Dino. All rights reserved.
//

#import "DOGCDVC.h"

@interface DOGCDVC ()

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
    self.view.backgroundColor = [UIColor redColor];
}

@end
