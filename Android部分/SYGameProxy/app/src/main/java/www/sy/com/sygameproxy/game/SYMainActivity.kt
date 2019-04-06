package www.sy.com.sygameproxy.game

import android.support.v7.app.AppCompatActivity
import android.os.Bundle

import www.sy.com.sygameproxy.R

class SYMainActivity : AppCompatActivity() {

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_symain)

        /*
        * Android是一个针对移动设备的操作系统/软件平台
        * 基于Linux内核
        * 使用Java/Kotlin来开发和管理代码
        * */

        /*
        * android特点：
        * 应用框架可以重复使用、组件也可以
        * Dalvik虚拟机针对移动设备进行优化
        * Android/iOS支持Open ES
        * 集成了基于开源的WebKit引擎
        * SQLite数据库
        * */

        /*
        * Android源代码完全开发
        * google不承诺遵守Java的规范
        * */

        /*
        * Android的架构：iOS的架构也应该搞懂-iOS的运行机制-底层
        * 应用层：我用Java开发/kotlin
        * 应用框架层：开发调用
        * 运行机制：DVM-JVM
        * 底层：linux内核/不是基于linux
        * */

        /*
        * android的核心机制：安全机制、内存管理、进程管理、网络驱动、硬件驱动
        * WebKit：基于开源WebKit的浏览器
        * */

        /*
        * App层
        * Activity manager  管理运行的应用软件
        * Content Provider  在各应用之间共享数据
        * Resource Manager  管理非资源文件
        * Notification Manager 显示用户提示和状态栏
        * Views
        * */

        /*
        * 安装Java JDK
        * assets  静态资源文件
        * */

        /*
        * 安卓核心组件：
        * view  界面视图/UI控件
        * Intent  意图
        * Activity  活动/类似iOS中的controller
        * Content Provider 存储共享数据
        * IntentReceiver 接受信息/事件处理
        * Service  后台服务
        * Notification 消息/通知
        * */

        /*
        * Activity manager 管理运行App
        * Content Provider 各应用之间共享数据
        * Resource Manager 管理非代码资源
        * Notification Manager 显示用户提示/状态栏
        * Views System 可以构建UI
        * */

        /*
        * activity-最基本的android组件
        * 1.生命周期：onCreate()
        * onStart()
        * onReStart()
        * */
    }
}
