//
//  WMGame.swift
//  WMGameProxy
//
//  Created by 谢吴军 on 2019/6/10.
//  Copyright © 2019 zali. All rights reserved.
//

/// swift中怎么导入框架
// 一般在swift中不需要导入框架
import UIKit

class WMGame: NSObject {
    /// swift简介
    // 编译语言的高性能 + 脚本语言的交互性
    func log() {
        // 输出函数
        /*
         /*
         swift语言允许注释嵌套
         */
         */
        /*
         1.单行语句无需加;（加上也可以）
         2.多个语句在一行：必须加;（一般不建议这样写）
         */
        print("Hello World")
    }
    
    /// 常量和变量
    // swift不会自动给变量赋初始值
    // swift中必须告诉编译器这是一个常量还是变量
    // 语句结束以后可以不跟 ; 如果一行有多条语句(不建议)需要加 ;
    func variable() {
        // 常量：值不能够被修改的量
        // 优先使用常量
        let myConstant: Int = 12
//        myConstant = 13 错误
        let uMyConstant: UInt = 13
        // 变量：值可以根据需要不断修改
        var myVariable = 42
        // 定义以后可以改变
        myVariable = 12
        print("\(myConstant) + \(myVariable) + \(uMyConstant)")
        /// 类型推导
        // swift是强类型语言
        // 根据后面值的类型推导出前面标识符的类型
        // 类型别名
        // typedef
        typealias NSInteger = Int
        let value: NSInteger = 45
        print("\(value))")
        
        // 布尔类型
        var shouldHide: Bool = false
        shouldHide = true
        if shouldHide {
            
        }
    }
    
    /// 字符串
    // swift中字符串不是指针而是实际的值
    // 常见的特殊字符串常量
    // 空字符 \0 反斜杠 \ 制表符 \t 换行符 \n 回车符 \r 双引号 \" 单引号 \'
    func FString() {
//        // 基本用不到
//        let char: Character = "A"
        let width = "The width is " // 定义字符串
        let widthButton = String()
        let widthLabel = 56
        // 前面是大写
        // 后面是小写
        print("\(width.uppercased())\(widthLabel)\(widthButton.lowercased())")
        // 判断字符串是否有特定前缀
        if width.hasPrefix("The") {
            
        }
        // 判断字符串是否有特定后缀
        if width.hasSuffix("width") {
            
        }
        // 判断字符串是否相等
        // 因为swift中字符串不是指针
        // 如果是指针 == 表明指针地址相等
        if width == "The width is " {
            
        }
        // 判断字符串是否为空
        if widthButton.isEmpty {
            // widthButton.count/NSString的length不一定相同
            // widthButton.count基于Unicode编码
            // NSString的length基于UTF-16编码
        }
    }
    
    /// 数组
    func FArray() {
        /// 定义
        var emptyArray0: [String] = []  // 空数组必须指定数组元素类型
        let array0 = ["芒果", "香蕉", "橘子"]  // 定义一个非空不可变数组
        /// 增加：增加在尾部
        // 增加一个元素
        emptyArray0.append("水")
        // 增加一个数组
        emptyArray0.append(contentsOf: array0)
        // 插入
        emptyArray0.insert("苹果", at: 2)
        // 数组的个数
        // 数组的个数 < 数组的容量
        // 数组的容量是2的次方
        print("数组的个数\(emptyArray0.count)===数组的容量\(emptyArray0.capacity)")
        if emptyArray0.isEmpty {
            // 数组是空的
        }
        /// 修改
        emptyArray0[1] = "哈密瓜"
        // 两边可以不相等
        // 这样数组的个数会减少两个
        emptyArray0[0...4] = ["banana", "apple"]
        /// 删除
        // 删除第一个元素
        emptyArray0.removeFirst()
        // 删除最后一个元素
        emptyArray0.removeLast()
        // 删除指定元素
        emptyArray0.remove(at: 2)
        // 删除所有元素
        emptyArray0.removeAll()
        /// 数组遍历
        // 第一种方式
        for item in emptyArray0 {
            print(item)
        }
    }
    
    /// 字典
    func FDictionary() {
        /// 定义
        var emptyDic0: Dictionary<String, String> = [:]
        // 冒号
        var dic0 = [
            "key0":"value0",
            "key1":"value1"
        ]
        /// 添加/修改
        // 如果存在key0则修改value
        // 如果不存在key0则添加value
        dic0["key0"] = "nsvalue0"  // 修改
        emptyDic0["key0"] = "nsvalue0" // 添加
        /// 删除
        // 第一种方式
        dic0["key0"] = nil
        // 第二种方式
        dic0.removeValue(forKey: "key0")
        // 输出
        print("字典的键值对：\(dic0.count)")
        // 遍历
    }
    
    /// 元组
    // 一般用于函数返回值
    func FTuple() {
        /// 定义
        // 1.定义一个简单的元组
        let (x0, y0) = (1, 2)
        print("x is \(x0), y is \(y0)")
        // 2.定义一个由Int和String组成的元组
        let httpError = (404, "Not Found")
        print("\(httpError.0) is \(httpError.1)")
        // 3.定义取别名的元组
        let httpSuccess = (statusCode: 200, des: "success")
        print("\(httpSuccess.statusCode) is \(httpSuccess.des)")
    }
    
    /// 可选类型
    // Objective-C中nil是一个指针指向不存在的对象
    // swift中nil不是指针而是一个特定类型空值（nil不能用于非可选类型）
    func FOptional() {
        // 要不存在、要不存在为nil
        // swift中nil不能赋值非可选类型
        // 默认值为nil
        // 调用方法返回值为nil
        var strValue: String?
        strValue = ""
        let hashValue = strValue?.hashValue
        if let hashValue = hashValue {
            print("\(hashValue)")
        }
//        /// 隐式解包
//        // 这样会存在崩溃吗?
//        // swift变量必须先init再使用
//        let window: UIWindow!
//        window.makeKeyAndVisible()
    }
    
    /// 运算符
    // 与OC不同：swift语言并不会把赋值运算符(=)作为一个值返回
    // 默认情况下Swift的运算符不允许值溢出
    /*
     区间
     a...b  // a到b（包含a和b）
     a..<b  // a到b（包含a不包含b）
     */
    // 流程控制
    func FOperator() {
        // switch语句
        // case后面可以匹配"区间"
        // case后面可以匹配"元组"
        // case分支允许"值绑定"
        
//        // 控制传递语句
//        fallthrough
//        break
//        continue
//        return
    }
    
    /// 函数的定义和调用
    // Void是空元组
    // 函数可以返回一个元组/可以返回多个值
    func FSwitchController(controller: UIViewController) -> Void {
        
    }
    
    // 可变参数
    // 可变参数一定要放在参数表中最后的位置
    func FChange(controller: UIViewController, number: Double...) {
        
    }
    
    // 闭包
    var list: [String?] = []
    
}
