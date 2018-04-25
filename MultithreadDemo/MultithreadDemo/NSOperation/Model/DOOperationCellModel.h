//
//  DOOperationCellModel.h
//  MultithreadDemo
//
//  Created by 魏欣宇 on 2018/4/26.
//  Copyright © 2018年 Dino. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSUInteger, OperationType) {
    OperationTypeInvocation = 0,         //NSInvocationOperation
    OperationTypeBlock,                  //NSBlockOperation
    OperationTypeSubclass,               //继承 NSOperation 的子类
    OperationTypeAddExecutionBlock,      //addExecutionBlock
    OperationTypeAddOperation,           //addOperation
    OperationTypeAddOperationWithBlock,  //addOperationWithBlock
    OperationTypeCommunication,          //线程间通信
    OperationTypeMaxConcurrent,          //最大并发数
    OperationTypeDependency              //操作依赖
};

@interface DOOperationCellModel : NSObject

@property (nonatomic, copy) NSString *cell_title;

@property (nonatomic, assign) OperationType type;

@property (nonatomic, copy) NSString *section_title;

+ (instancetype)operationCellModelWithTitle:(NSString *) cell_title type:(OperationType) type;

@end
