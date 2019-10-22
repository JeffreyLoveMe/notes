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
    func variable() {
        // 常量：值不能够被修改的量
        let myConstant = 12
//        myConstant = 13 错误
        // 变量：值可以根据需要不断修改
        var myVariable = 42
        myVariable = 12
        print("\(myConstant) + \(myVariable)")
        // 类型推导
        
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
    func FString() {
        let width = "The width is " // 定义字符串
        let widthLabel = 56
        print("\(width)\(widthLabel)")
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
        var dic0 = ["key0":"value0", "key1":"value1"]
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
    func FTuple() {
        // 定义
        let (x0, y0) = (1, 2)
        let (x1, y1) = (404, "Not Found")
        // 
    }
}
