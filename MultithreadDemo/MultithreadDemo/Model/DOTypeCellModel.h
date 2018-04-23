//
//  DOTypeCellModel.h
//  MultithreadDemo
//
//  Created by 魏欣宇 on 2018/4/24.
//  Copyright © 2018年 Dino. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DOTypeCellModel : NSObject

@property (nonatomic, copy) NSString *cell_title;

@property (nonatomic, assign) Class vc_class;

+ (instancetype)typeCellModelWithTitle:(NSString *) cell_title pushClass:(Class) vc_class;

@end
