//
//  SyGameProxy.c
//  WMGameProxy
//
//  Created by 谢吴军 on 2019/6/20.
//  Copyright © 2019 zali. All rights reserved.
//

#include <stdio.h>

//打电话
// 必须先声明、再调用
// 不能写在main()底下
int call() {
    printf("打电话");
    return 0;
}

// C语言程序是由很多“程序段”组成的
int main(int argc, const char * argv[]) {
    printf("Hello World!\n");  // 调用系统函数
    call(); // 调用自定义函数
    return 0;
}

#include "SyGameProxy.h"


