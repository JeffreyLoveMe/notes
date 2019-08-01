//
//  WMController.swift
//  WMGameProxy
//
//  Created by 谢吴军 on 2019/6/10.
//  Copyright © 2019 zali. All rights reserved.
//

import UIKit

class WMController: UIViewController {
    // 最高权限：一般sdk提供外部使用、可继承
    open var p1: String?
    // 比open小一点、不可继承
    public var p2: String?
    // 包内可以使用
    internal var p3: String?
    // 文件内可以使用
    fileprivate var p4: String?
    // 类内部可以使用
    private var p5: String?

    override func viewDidLoad() {
        super.viewDidLoad()

    }
  
}
