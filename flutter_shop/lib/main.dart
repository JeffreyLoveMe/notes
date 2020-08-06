import 'package:flutter/material.dart';
// 引入本地文件
import './pages/index_page.dart';

/*
 主函数
 1.入口函数
 */
// flutter clean - 清除缓存
void main() {
  runApp(MyApp());
}

// Awesome Flutter Snippets - 快速生成代码插件
class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // 基本每个页面都最好加一个Container - 有利于扩展
    return Container(
      child: MaterialApp(
        // 任务管理窗口显示的应用名称 - 一般写AppName
        title: '百姓生活+',
        // 去掉debug样式
        debugShowCheckedModeBanner: false,
        // 整体样式
        theme: ThemeData(
          primaryColor: Colors.pink
        ),
        // 这里显示文件出口 - 外接文件
        // IndexPage - 初始化操作一般放在该页面
        home: IndexPage(),
      ),
    );
  }
}