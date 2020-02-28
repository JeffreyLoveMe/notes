//
//  WMGame.swift
//  WMGameProxy
//
//  Created by 谢吴军 on 2019/6/10.
//  Copyright © 2019 zali. All rights reserved.
//

/// 0.2014年 Apple 发布 swift
// https://www.cnswift.org/the-basics

/// 1.swift中怎么导入框架
// 一般在 swift 中不需要导入框架
import UIKit

class WMGame: NSObject {
    /// 2.swift简介
    // 编译语言的高性能 + 脚本语言的交互性
    func log() {
        /// 定义标识符
        // swift中定义标识符必须告诉编译器是一个常量还是一个变量
        let myName: String = ""  // 常量
        var myAge: Int = 0          // 变量
        myAge = 10
        print("\(myName) is \(myAge)")
        
        /// 3.swift语句结束
        // 1.单行语句无需加";"（加上也可以）
        // 2.多个语句在一行：必须加";"（一般不建议这样写）
        // 输出函数
        print("Hello World")
        
        /// 4.常量和变量
        // 1.swift中必须告诉编译器这是一个常量还是变量
        // 2.使用过程中建议先定义常量，如果需要修改再修改成变量
//        // ！！！3.常量是指向的对象不可以进行修改，但是可以改变对象内部属性！！！
//        let myView: UIView = UIView()
//        myView = UIView() // 错误
//        myView.backgroundColor = UIColor.red; // 正确
        // 4.swift不会自动给变量赋初始值
        // 常量：值不能够被修改的量/优先使用常量
        let myConstant: Int = 12
//        myConstant = 13 // 错误
        let uMyConstant: UInt = 13
        // 变量：值可以根据需要不断修改
        var myVariable = 42
        // 定义以后可以改变
        myVariable = 12
        print("\(myConstant) + \(myVariable) + \(uMyConstant)")
        
        /// 5.类型推导
        // 1.swift数据类型：整型Int/浮点型Double/对象类型/结构体类型
        // 2.Int == NSInteger
        // 3.swift是强类型语言（属性有明确的类型，不存在 id 类型）
        // 4.根据后面值的类型推导出前面标识符的类型
        // typealias类型别名
        typealias NSInteger = Int
        let value: NSInteger = 45
        print("\(value))")
        
        /// 6.swift中基本运算
        // 1.进行基本运算必须保证类型一致，否则会报错
        // 2.相同类型才可以进行运算
        // 3.因为swift中没有 “隐式转换”
        // 4.强制类型转换
        let m1: Double = 3.14
        let tempM: Int = Int(m1)
        print("\(tempM)")
        // 5.默认情况下 swift 的运算符不允许值溢出
        
        /// 7.逻辑分支
        // 1.if语句
        // 1).if后面的 () 可以省略
        // 2).判断语句不再有“非0即真”/必须有明确的真假
        let score = 10
        if score > 10 {

        } else if score == 9 {
            
        } else {
            
        }
        // 2.三目运算符
        let m2 = 10
        let n2 = 15
        var result = 0
        result = m2 > n2 ? m2 : n2
        // 3.guard语句
        // 1).提高程序的可读性
        // 2).guard 必须与 else 同时使用
        guard m2 > 10 else {
            // 语句块1
            // 如果 条件语句（ m2 > 10 ）为 false？则执行 “语句块1”
            // “不成立”执行这里
            /// ！！！这里一般情况下会使用以下一种语句！！！
            // 必须加一个 “关键字”
            // return
            // break
            // continue
            // throw
            return
        }
        // 语句块2
        // 如果 条件语句（ m2 > 10 ）为 true？则执行 “语句块2”
        // 3)."guard语句"必须在 “函数” 中使用
        // 4.switch语句
        // 1).switch的基本使用
         let sex = 0
        // switch后面的 “()” 可以省略
        // case语句结束后 “break” 可以省略
        switch sex {
        case 0:
            print("男")
//            // 2).如果系统想要产生 "case穿透"
//            fallthrough
        case 1:
            print("女")
        default:
            print("未知")
        }
        // 3).case后面可以判断多个条件，多个条件以 “,” 隔开/ 类似于 “或”
        switch sex {
        case 0, 1:
            print("正常人")
        default:
            print("未知")
        }
        // 4).swift中switch可以判断浮点型
        let pi = 3.14
        switch pi {
        case 3.14:
            print("这是一个pi")
        default:
            print("这不是一个pi")
        }
        // 5).switch可以判断字符串
        let m3 = 10
        let n3 = 20
        let opration = "+"
        switch opration {
        case "+":
            result = m3 + n3
        case "-":
            result = m3 - n3
        case "*":
            result = m3 * n3
        case "/":
            result = m3 / n3
        default:
            print("非法操作符")
        }
        // 6).switch可以判断区间/重点知识
        // swift中有两种常见的区间
        // 1.开区间 - 0..<10/0到9不包含10
        // 2.闭区间 - 0...10/0到10包含10
        // 0..<10/0...10是一个整体
        switch score {
        case 0..<60:
            print("不及格")
        case 60..<85:
            print("及格")
        case 85...100:
            print("优秀")
        default:
            print("不合理的分数")
        }
        
        /// 8.循环
        // 1.for循环
//        // ！！！swift3.x移除该写法！！！
//        for var index = 0; index < 10; index++ {
//            print(index)
//        }
        // 打印 1-9
        for index in 0..<10 {
            print(index)
        }
        // 打印 10次 “hello world”
        // 在 swift 中如果一个标识符不需要使用可以使用 ”_“ 来代替
        for _ in 0..<10 {
            print("hello world")
        }
        // 2.while循环
        // 0).条件不成立 -> 终止循环
        // 1).while后面的()可以省略
        // 2).while后面的判断条件没有 “非0即真”
        var m4 = 10
        while m4 > 0 {
            print(m4)
            // swift中没有“自增自减”
            m4 = m4 - 1
        }
        // 3.do...while循环
        // 0).条件不成立 -> 终止循环
        // 1).swift中没有 “do...while循环”
        // 2).swift中有 “repeat...while循环”
        repeat {
            print(m4)
            m4 = m4 - 1
        } while m4 > 0
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
