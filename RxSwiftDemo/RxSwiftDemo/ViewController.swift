//
//  ViewController.swift
//  RxSwiftDemo
//
//  Created by 谢吴军 on 2019/9/12.
//  Copyright © 2019 zali. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift
import RxRelay

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        /// ReactiveX是一个可以帮助我们简化异步编程的框架
        // RxSwift是Rx的Swift版本
        // 原理：KVO/异步操作/流全部统一成抽象序列
        
        // RxSwift安装
        // 不需要依赖第三方依赖
        
        // RxSwift可以为我们做什么？
        // ！！！这一块等待学习完成以后！！！
    }
}

/// 第一个RxSwift程序
extension ViewController {
    /*
     模拟用户登录：帐号/密码不足5位给出红色提示
     */
    func login() {
        let minimalLength = 5
        // 控件
        var userNameTf: UITextField = UITextField()
        var userNameLabel: UILabel = UILabel()
        var passWordTf: UITextField = UITextField()
        var passWordLabel: UILabel = UILabel()
        var completeBtn: UIButton = UIButton()
        // 是户名是否有效
        let userNameValid = userNameTf.rx.text.orEmpty
            .map { $0.count >= minimalLength }
            .share(replay: 1, scope: .whileConnected)
        // 是户名是否有效 -> 密码框是否可用
        userNameValid
            .bind(to: passWordTf.rx.isEnabled)
            .disposed(by: DisposeBag())
        // 是户名是否有效 -> 提示语是否隐藏
        userNameValid
            .bind(to: userNameLabel.rx.isHidden)
            .disposed(by: DisposeBag())
        // 用户密码是否有效
        let passWordValid = passWordTf.rx.text.orEmpty
            .map {$0.count >= minimalLength }
            .share(replay: 1, scope: .whileConnected)
        // 用户密码是否有效 -> 提示语是否隐藏
        passWordValid
            .bind(to: passWordLabel.rx.isHidden)
            .disposed(by: DisposeBag())
        // 所有输入都有效果
        let everyThingValid = Observable.combineLatest(
            userNameValid,
            passWordValid
        ) { $0 && $1 }
            .share(replay: 1, scope: .whileConnected)   // 共享同一源
        // 可以登录
        everyThingValid
            .bind(to: completeBtn.rx.isEnabled)
            .disposed(by: DisposeBag())  // 将绑定的生命周期交给DisposeBag处理
        // 点击button
        completeBtn.rx.tap
            .subscribe(onNext: {[weak self] in self?.showAlert()})
            .disposed(by: DisposeBag())
    }
    

    // 弹窗
    func showAlert() {
        let alertView = UIAlertView(
            title: "提示",
            message: "帐号或密码不足5位",
            delegate: nil,
            cancelButtonTitle: "确定")
        alertView.show()
    }
}


/// 函数响应式编程 = 函数式编程 + 响应式编程
// 一种编程范式：通过构建函数操作数据序列，然后对这些序列做出响应的编程方式
extension ViewController {
    // 函数式编程：需要我们将函数作为参数/返回值
    // 函数编程 -> 函数响应式编程
    // https://beeth0ven.github.io/RxSwift-Chinese-Documentation/content/think_reactive/functional_reactive_progaramming.html
    
    
}

