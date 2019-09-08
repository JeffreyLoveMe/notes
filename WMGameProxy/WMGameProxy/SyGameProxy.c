//
//  SyGameProxy.c
//  WMGameProxy
//
//  Created by 谢吴军 on 2019/6/20.
//  Copyright © 2019 zali. All rights reserved.
//

/// 预处理指令：在代码被翻译成0和1之前被替换
// 将stdio.h/c文件copy到该文件中
// 不用必须写在文件最上面
// <>代表会先从Xcode中查找，如果系统中查找找不到
#include <stdio.h>

//打电话
// 必须先声明、再调用
// ！！！不能写在main()底下！！！
// {}中代码就是程序段
// 其它只有在调用的时候才会执行
int call() {
    printf("打电话");
    return 0;
}

// 先写函数声明
int getMax(int m, int n);

//// C语言程序是由很多“程序段”组成的
//// 有且仅有一个main()函数
//// '\n' -换行、其它语言一样适用
//// 同一个程序中只能有一个main()函数
//// 一般需要将主要的(main函数/生命周期函数放在最前面)
//// 系统在启动程序的时候会自动调用main函数
//// argc：系统传递进来的参数个数，默认是1
//// argv[]：系统传递进来的参数实际值，默认程序的名称
//// 怎么添加参数：WMGameProxy -> EditScheme -> Run -> Arguments
//int main(int argc, const char * argv[]) {
//    printf("Hello World!\n");  // 调用系统函数
//    call(); // 调用自定义函数
//    int result = getMax(10, 11);
//    return 0;
//}

/// 函数：不使用函数的弊端 - 不易维护
// 提高代码复用性
// 一段具备特定功能的程序段
/*
 返回值类型 函数名称 (形参列表) {
    // 函数体
 }
 */
/*
 定义函数：
 1.函数名称、2.函数参数、3.函数返回值
 */
// m/n称为形式参数：只有当函数被调用的时候才会分配内存
int getMax(int m, int n) {
    int max = m > n ? m : n;
    // 返回数据给函数调用者
    // 结束函数
    return max;
}

// 递归：函数自己调用自己
// 一般可以使用循环的地方都可以使用递归
// 慎用递归
int result = 1;
int xxx(int n) {
    result = result * n;
    // 1.必须有明确的结束标志
    if (n == 1) {
        return result;
    } else {
        // 2.自己调用自己
        return xxx(n-1);
    }
}

#include "SyGameProxy.h"


