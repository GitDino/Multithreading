//
//  DOThreadCellModel.h
//  MultithreadDemo
//
//  Created by 魏欣宇 on 2018/4/24.
//  Copyright © 2018年 Dino. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSUInteger, ThreadCellModelType) {
    ThreadCellModelTypeManual = 0,  //手动开启 start
    ThreadCellModelTypeAutomatic,   //自动生成、开启
    ThreadCellModelTypeImplicit     //隐式创建，直接启动
};

@interface DOThreadCellModel : NSObject

@property (nonatomic, copy) NSString *cell_title;

@property (nonatomic, assign) ThreadCellModelType type;

+ (instancetype)threadCellModelWithTitle:(NSString *) cell_title type:(ThreadCellModelType) type;

@end
