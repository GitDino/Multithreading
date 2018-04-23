//
//  DORunLoopCellModel.h
//  MultithreadDemo
//
//  Created by 魏欣宇 on 2018/4/24.
//  Copyright © 2018年 Dino. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSUInteger, RunLoopType) {
    RunLoopTypeTimer = 0,  //定时器
    RunLoopTypeCustom      //子线程里管理RunLoop
};

@interface DORunLoopCellModel : NSObject

@property (nonatomic, copy) NSString *cell_title;

@property (nonatomic, assign) RunLoopType type;

+ (instancetype)runLoopCellModelWithTitle:(NSString *) cell_title type:(RunLoopType) type;

@end
