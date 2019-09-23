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
// <>代表先从开发工具的编译环境中查找
// 如果找不到、再到系统的编译环境中查找
// ""表示先从当前文件的文件夹中查找
// 然后再<>
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
//// main函数只能由系统调用，不能手动调用
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
//        // 3.调用函数：将函数内部代码继续执行一遍
//        Log(n);
        return xxx(n-1);
    }
//    // 给关键字取别名：int还是可以使用
//    typedef int Integer;
//    Integer m = 100;
//    printf("%i", m);
}

/// 函数
// 1.标准函数：由官方或第三方库提供的函数，可以直接使用
// 2.自定义函数：由程序员自己编写的函数
// 2.实现函数
void Log(int m) {
    printf("hello world");
}
// 有参有返回值/有参无返回值/无参有返回值/无参无返回值
// 形参&实参

/// 类型说明符
// 1.说明长度：可以用来修改类型所占用的存储空间大小
int m0;   // 4个字节
short int m1;  // 2个字节
long int m2;   // 8个字节
long long m3; // xx个字节
// 2.说明符号位：可以用于修改符号位
signed int m4; // 正数/负数/零

#include "SyGameProxy.h"


