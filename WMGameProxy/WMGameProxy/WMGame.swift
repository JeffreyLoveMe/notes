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
        print(value)
        
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
        guard m2 >= 10 else {
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
    
    /// 9.字符串
    // swift中字符串不是指针而是实际的值
    // String是一个结构体
    /**
     常见的特殊字符串常量
     1.空字符 \0
     2.反斜杠 \
     3.制表符 \t
     4.换行符 \n
     5.回车符 \r
     6.双引号 \"
     7.单引号 \'
     */
    func string() {
        // 1.定义字符串
        // 1).定义不可变字符串
        let opration: String = "+"
        // 2).定义可变字符串
        var str0 = "xwj"
        str0 = "wy"
        // 3).定义空字符串
        var emptyString = ""
        
        // 2.遍历字符串
        for char in opration {
            print("\(char) + \(str0)")
        }
        
        // 3.字符串拼接
        // 1).连个字符串之间的拼接
        let str1 = "小码哥"
        let str2 = "IT教育"
        let plusStr = str1 + str2
        // 2).字符串和其它标识符之间的拼接
        let count: Int = 10000
        print("\(plusStr)有\(count)名学生")
        // 3).拼接字符串时，字符串的格式化
        let min = 2
        let second = 18
        let _ = String(format: "%02d:%02d", [min, second])
        
        // 4.字符串的截取
        let urlString = "www.520it.com"
        // 将 string 转换成 NSString
        let headerString = (urlString as NSString).substring(to: 3)
        let middleString = (urlString as NSString).substring(with: NSMakeRange(4, 5))
        let footerString = (urlString as NSString).substring(from: 10)
        print(headerString + middleString + footerString)
        
        // 5.字符串其它方法
        // 1).前面是大写/后面是小写
        print("\(headerString.uppercased())\(footerString)\(footerString.lowercased())")
        // 2).判断字符串是否有特定前缀
        if urlString.hasPrefix("www") {
            
        }
        // 3).判断字符串是否有特定后缀
        if urlString.hasSuffix("width") {
            
        }
        // 4).判断字符串是否相等
        // 因为 swift 中字符串不是指针
        // 如果是指针 == 表明指针地址相等
        if urlString == "www.520it.com" {
            
        }
        // 5).判断字符串是否为空
        // 第一种方式
        if urlString.isEmpty {
            // urlString.count/NSString的length不一定相同
            // urlString.count基于Unicode编码
            // NSString的length基于UTF-16编码
        }
        // 第二种方式
        if urlString.count == 0 {
            
        }
    }
    
    /// 10.数组
    // 1.数组Array是一串有序的由相同类型元素构成的集合
    // 2.数组中的元素是有序的、可以重复出现
    func array() {
        // 3.定义数组
        // 1).定义不可变数组
        /**
         option + 鼠标右键 - 查看属性类型
         command + 鼠标右键 - 查看源码
         */
        let array = ["why", "yz", "lmj"]
        // 2).定义可变数组
//        var arrayM = Array<String>() // 不常用
        var arrayM = [String]()
        // 定义空数组必须指定数组类型
        var _: [String] = []
        // 3).定义空数组
        var emptyArray: [String] = []
        
        // 4.对可变数组的基本操作
        // 1).追加元素
        arrayM.append("lnj")  // 追加在尾部
        arrayM.append("why")  // 数组中可以有相同元素
        arrayM.append(contentsOf: array) // 追加一个数组
        // 2).删除元素
//        arrayM.removeFirst()
//        arrayM.removeLast()
//        arrayM.remove(at: 2)
//        arrayM.removeAll()
        // 3).修改元素
        arrayM[0] = "xwj"
        arrayM[1] = "xwj"
        // 4).获取元素
        let _ = arrayM[1]
        // 5).插入元素
        arrayM.insert("xwj", at: 2)
        
        // 5.数组的遍历
        // 1).根据下标
        for index in 0..<arrayM.count {
            print(arrayM[index])
        }
        // 2).直接遍历元素
        for name in arrayM {
            print(name)
        }
        // 3).遍历数组中前两个元素/部分遍历
        for name in arrayM[0..<2] {
            print(name)
        }
        
        // 6.数组的合并
        // 相同类型的数组才可以进行合并，不同类型数组不能相加合并
        let _ = arrayM + array
    }
    
    /// 11.字典
    // 1.swift中字典类型是Dictionary/泛型集合
    // 2.字典的元素是无序的
    func dictionary() {
        // 1.定义字典
        // 1).定义不可变字典
        let dict: [String : Any] = ["name":"xwj", "age":18, "height": 1.88]
        // 2).定义可变字典
//        var dictM = Dictionary<String, Any>() // 不常用
        /**
         NSObject - 一般用于创建对象
         AnyObject - 一般用于指定类型
         */
        var dictM = [String : Any]()
        // 3).定义空字典
        var emptyDictionary1: [String: Any] = [:]
        var emptyDictionary2: Dictionary<String, Any> = [:]
        
        // 2.对可变字典的基本操作
        // 1).添加元素
        dictM["name"] = "why"
        dictM["age"] = 18
        dictM["height"] = 1.88
        // 2).删除元素
        dictM.removeValue(forKey: "age")
        // value 设置为空也可以删除字典元素
        dictM["name"] = nil
        // 3).修改元素
        // 如果字典中已经有对应的 key -> 修改原 key 中保存的 value
        // 如果字典中没有对应的 key -> 添加 key / value
        dictM["name"] = "yz"
        // 4).获取元素
        let _ = dictM["name"]
        
        // 3.遍历字典
        // 1).遍历字典中所有的key
        for key in dict.keys {
            print(key)
        }
        // 2).遍历字典中所有的value
        for value in dict.values {
            print(value)
        }
        // 3).遍历所有的键值对
        for (key, value) in dict {
            print(key)
            print(value)
        }
        
        // 4.合并字典
        // 即使字典类型一致也不能相加合并
    }
    
    /// 12.元组
    // 1.一种数据结构，组成”元组的数据“称为”元素“
    // 2.一般元组作为方法的返回值
    func tuple() {
        // 1.元组的写法
        // 1).元组的基本用法
        let info_0 = ("yz", 18, 1.88)
        print("\(info_0.0)\(info_0.1)\(info_0.2)")
        // 2).元组取别名（常用写法）
        let info_1 = (name: "yz", age: 18, height: 1.88)
        print("\(info_1.name)\(info_1.age)\(info_1.height)")
        // 3).元素的别名就是元组的名称
        let (name, age, height) = ("yz", 18, 1.88)
        print("\(name)\(age)\(height)")
    }
    
    /// 13.可选类型
    // 1.swift中 nil 不是指针，是一种特定的类型 / Objective-C中 nil 是一个指针指向不存在的对象
    // 2.swift中规定：对象中所有的属性都必须有明确的初始化值
    func optional() {
        // 3.定义可选类型
        // 1).方式一/不常用
        var name: Optional<String> = nil
        // 2).方式二/语法糖/常用
        var age: Int? = nil
        
        // 4.给可选类型赋值
        name = "xwj"
        age = 0
        
        // 5.取出可选类型的值
        // 强制解包：非常危险，如果可选类型为 nil，则系统会崩溃
        if name != nil {
            print(name!)
        }

        // 6.可选绑定
        // 1).判断age是否有值，如果没有值，直接不执行{}
        // 2).如果age有值系统会自动将age进行解包，并将解包的结果赋值给tempAge
        if let tempAge = age {
            print(tempAge)
        }
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
