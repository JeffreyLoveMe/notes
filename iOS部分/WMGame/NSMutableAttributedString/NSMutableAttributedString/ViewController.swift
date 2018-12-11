//
//  ViewController.swift
//  NSMutableAttributedString
//
//  Created by 谢吴军 on 2018/12/8.
//  Copyright © 2018 zali. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let msg = "我是中国人"
    
    lazy var  = <#expression#>
    

    override func viewDidLoad() {
        super.viewDidLoad()
        //创建富文本：带属性的文本
        let attr_01 = NSMutableAttributedString(string: msg)
//        let attr_02 = NSMutableAttributedString(attributedString: attr_01)
//        let attr_03 = NSMutableAttributedString(string: msg, attributes: nil)
        
    attr_01.addAttributes([NSAttributedString.Key.font:UIFont.systemFont(ofSize: 13.0)], range: NSMakeRange(0, 4))
     attr_01.addAttributes([NSAttributedString.Key.foregroundColor:UIColor.red], range: NSMakeRange(4, 4))
        
    }


}

extension ViewController {
    //NSMutableAttributedString = NSMutableAttributedString(init)
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
}

