//
//  main.m
//  RunLoop-Simple
//
//  Created by 魏欣宇 on 2018/4/24.
//  Copyright © 2018年 Dino. All rights reserved.
//

#import <Foundation/Foundation.h>

void clickFunction(int type) {
    printf("正在执行第 %d 条指令", type);
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        while (YES) {
            printf("请输入您的选项：(0表示退出)\n");
            int result = -1;
            scanf("%d", &result);
            if (result == 0)
            {
                printf("程序结束！\n");
                break;
            }
            else
            {
                clickFunction(result);
            }
        }
        
    }
    return 0;
}
