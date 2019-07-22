package www.dn.com.dngameproxy;

import android.content.Intent;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;

public class HomeActivity extends AppCompatActivity {
    // 创建Activity
    // Activity声明周期的开始
    // 初始化
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_home);
        // 什么是Android
        // 1.针对移动设备的操作系统和软件平台
        // 2.基于Linux内核、由Google和开放手机联盟开发

        // Android特点
        // 1.框架可以重复使用、组件可以更换
        // 2.集成基于WebKit引擎的浏览器
        // 3.SQLite作为结构化数据存储
        // 4.支持Bluetooth、3G、WiFi
        // 5.支持照相机、GPS、指南针等传感器硬件
        // 6.丰富的开发环境：模拟器/调试工具/内存运行检测等插件

        // Android优缺点
        // 优点
        // 1.源代码完全开放
        // 2.运营商的大力支持、产业链成熟
        // 3.具有强大的Linux社区的支持
        // 缺点
        // 1.google提供的一套Java核心包尚不遵循任何Java规范
        // 2.开发工作量依旧很大

        // Android架构
        // 1.底层-基于Linux内核
        // 2.运行机制-DVM/JVM
        // 3.应用框架-开发调用
        // 4.应用层

        // Android中App
        // 1.Activity manager -管理运行应用程序
        // 2.Content Provider -各应用之间共享数据
        // 3.Resource manager -管理非代码资源
        // 4.Notification manager -显示用户提示和状态栏
        // 5.Views System -构建UI

        // Android程序核心组件
        // View -界面视图、组织UI控件
        // Intent -意图、支持组件之间通信
        // Activity -处理界面和UI互动
        // Content Provider -存储共享数据
        // IntentReceiver -接收信息及事件处理
        // Service -后台服务、硬件与驱动的服务
        // Notification -消息与通知

        // 活动Activity
        // Activity是最基本的Android应用程序组件
        // 一个Activity就是一个单独的屏幕、类似Controller
        // 当一个新Activity启动、前一个Actiity就会暂停、保存在历史堆栈中
        // Activity的声明周期：见HomeActivity.java
        // Activity的三种状态
        // 1.可以响应用户操作：当Activity在屏幕前台、位于当前任务堆栈的顶部、处于激活/运行状态
        // 2.对用户可见/不能响应操作：暂停状态
        // 3.对用户不可见：停止状态

        // 意图Intent
        // 设计理念：减少组件之间的耦合
        // Intent可以激活：活动、服务、广播接收器
        // 显式Intent -指定组件名/类对象
        // 隐式Intent -在manifests设置action动作/category类别/URI数据找到合适的组件

        // Bundle可以携带数据
        // putXxx()/getXxx()
        // Bundle内部使用了HashMap<K,V>存放数据

        // 安卓程序的运行
        // 1.Java是从Main()进入程序的、Android
        Button jumpBtn = (Button)findViewById(R.id.jump);
        jumpBtn.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                // 上下文/class
                Intent intent = new Intent();
                intent.setClass(HomeActivity.this, MainActivity.class);
                Bundle bundle = new Bundle();
                bundle.putInt("age",18);
                bundle.putString("name","谢吴军");
                intent.putExtra("person", bundle);

                startActivity(intent);
            }
        });

        // 得到新Activity返回的数据
        // p47
    }

    // 开始
    @Override
    protected void onStart() {
        super.onStart();
    }

    @Override
    protected void onRestart() {
        super.onRestart();
    }

    @Override
    protected void onResume() {
        super.onResume();
    }

    @Override
    protected void onPause() {
        super.onPause();
    }

    @Override
    protected void onStop() {
        super.onStop();
    }

    // 销毁
    // 释放所有资源
    @Override
    protected void onDestroy() {
        super.onDestroy();
    }
}
