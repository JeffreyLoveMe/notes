//
//  WMController.swift
//  WMGameProxy
//
//  Created by 谢吴军 on 2019/6/10.
//  Copyright © 2019 zali. All rights reserved.
//

import UIKit
//// 可以在此处遵循协议
//class WMController: UIViewController, UITableViewDataSource, UITableViewDelegate {
//
//}
class WMController: UIViewController {
    /// 18.swift修饰符
    // 最高权限 - 一般 sdk 提供外部使用/可继承
    open var p1: String?
    // 比 open 小一点、不可继承
    public var p2: String?
    // 包内可以使用 - 默认
    internal var p3: String?
    // 文件内可以使用
    fileprivate var p4: String?
    // 类内部可以使用
    private var p5: String?
    // 单例
    public static let instance = WMController()
    
    /// 19.懒加载
    // 1>.swift中也有懒加载只能放在结构体/类中
    // 2>.swift直接用lazy关键字定义某一个属性懒加载
    // 3.格式
//    // 第一种方式
//    lazy var tableView: UITableView = UITableView()
    // 第二种方式
    lazy var tableView: UITableView = {
        let tableView = UITableView(frame: view.bounds, style: .grouped)
        tableView.dataSource = self
        tableView.delegate = self
        return tableView
    }()

    /// 20.UITableView
    override func viewDidLoad() {
        super.viewDidLoad()
        /// 21.swift中注释
        // MARK:- 类似 “#pragma mark” ｜ 会分类
        /// 类似 “/** */” ｜ 书写会有提示
        self.setupUI()
    }
}

// 类似 “Category”
// 只能扩充方法/不能扩充属性
// MARK:- 设置界面相关
extension WMController {
    func setupUI() {
        view.addSubview(tableView)
    }
}

// MARK:- 设置代理
extension WMController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return 20
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cellID = "cellID"
            // 1.创建 cell
    //        // 1>.该方法返回 UITableViewCell/必须先注册/推荐使用这个
    //        var cell = tableView.dequeueReusableCell(withIdentifier: "", for: indexPath)
            // 2>.该方法返回UITableViewCell?/无需注册
            var cell = tableView.dequeueReusableCell(withIdentifier: cellID)
            if cell == nil {
                // 在 swift 中怎么使用枚举
                // 1>.枚举类型.具体类型
                // 2>./.具体类型
                // 如果需要使用 ‘|’ 连接枚举需要先把枚举转换成 type.rawValue
                cell = UITableViewCell(style: .default, reuseIdentifier: cellID)
            }
            // 2.给 cell 赋值
            cell?.textLabel?.text = "测试数据\(indexPath.row)"
            // 返回 cell
            return cell!
        }
}

// MARK:- 设置代理
extension WMController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("点击了\(indexPath.row)")
    }
}

/// 22.动态库
// 1.swift不支持创建静态库
// 2.swift新建动态库与新建xxx.framework一致（第一步不用修改为静态库/第二步没有头文件导入/使用的时候需要链接为动态库）

/// 23.枚举
extension WMController {
    //
    /**
     1).命名规范
     1>.在swift中enum名称大写、元素小写
     2>.在oc中enum名称大写、元素大写
     */
    enum CalendarTimeType: Int {
        case none = 1
        case new
        case old
    }
    func type() {
        // 数字 -> 枚举
        let _: CalendarTimeType? = CalendarTimeType.init(rawValue: 1)
        // 枚举 -> 数字
        print("\(CalendarTimeType.new.rawValue)")
    }
}
