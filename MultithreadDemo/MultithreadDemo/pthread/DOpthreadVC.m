//
//  DOpthreadVC.m
//  MultithreadDemo
//
//  Created by 魏欣宇 on 2018/4/24.
//  Copyright © 2018年 Dino. All rights reserved.
//

#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height

#import "DOpthreadVC.h"

@interface DOpthreadVC ()

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
    
}

#pragma mark - Event Cycle


#pragma mark - Getter Cycle


@end
