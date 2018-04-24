//
//  DOGCDCellModel.h
//  MultithreadDemo
//
//  Created by 魏欣宇 on 2018/4/25.
//  Copyright © 2018年 Dino. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSUInteger, GCDType) {
    GCDTypeSerialSyn = 0,   //串行同步
    GCDTypeSerialAsyn,      //串行异步
    GCDTypeConcurrentSyn,   //并发同步
    GCDTypeConcurrentAsyn,  //并发异步
    GCDTypeMainSyn,         //主队列同步
    GCDTypeMainAsyn,        //主队列同步
    GCDTypeOther1,          //GCD线程间通信
    GCDTypeOther2,          //GCD队列组
    GCDTypeOther3,          //GCD快速迭代
    GCDTypeOther4           //GCD栅栏
};

@interface DOGCDCellModel : NSObject

@property (nonatomic, copy) NSString *cell_title;

@property (nonatomic, assign) GCDType type;

+ (instancetype)GCDCellModelWithTitle:(NSString *) cell_title type:(GCDType) type;

@end
