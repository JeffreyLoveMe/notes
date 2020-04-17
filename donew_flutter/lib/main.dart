/// 1.什么是flutter
// 1>.概念 - flutter是google开发的移动UI框架。可以快速的在iOS/Android上构建高质量的原生用户界面。
// 2>.特点 - flutter可以与现有的代码一起工作/flutter是完全免费、开源的
// 3>.兼容 - iOS/Android/wp/web

/// 2.跨平台解决方案
// 1>.Web/Hybrid - 基于web相关技术来实现界面和功能/cordova
// 2>.jsCore - 通过JsCore桥接调用原生服务/React Native/Weex
// 3>.Native - 将某个语言编译成二进制文件，生成动态库/打包成apk&iap/flutter

/// 3.选择flutter的原因
// 1>.Web/Hybrid - UI性能差，功能性Api缺失
// 2>.RN - UI性能一般，开发体验差
// 3>.flutter - UI性能好，开发体验较好

/// 4.flutter组成
// 1>.Engine(C++) - Skia/Dart/Text
// 2>.Framework - Dart

/// 5.flutter环境搭建
/**
 * flutter create -i swift -a kotlin xxx
 */
// command + shift + p - 打开搜索选项

/// 6.flutter项目文件
/**
 * DONEW_FLUTTER
 * .dart_tool - 工具包
 * .idea - 环境配置
 * android - 安卓包
 * build - xxx
 * ios - iOS包
 * lib - 主要工程目录
 * test - 测试事例
 * .gitignore - 忽略文件
 * .metadata - 元信息
 * .packages - 包信息
 * donewflutter.iml - xxx
 * pubspec.lock - xxx
 * pubspec.yaml - 当前项目的信息（很重要）
 * README.md - xxx
 */

/// 7.Dart语言简介
// 1>.Dart语言是一个由Google开发的通用编程语言。后来被Ecma（Ecma-408）批准为标准。用于构建web/服务器/桌面和移动应用
// 2>.Dart语言是一种面向对象的，类定义的，垃圾回收语言。使用C样式语法可以随意地转换成js
// 3>.Dart语言支持接口/mixin/抽象类/具体化泛型/静态类型

/// 8.Dart语言概念
// 1>.Dart语言中一切（无论变量、数字、函数、null）皆对象，所有对象都是Object类的子类
// 2>.Dart语言是强类型语言（一旦确定类型就不可以改变变量类型，编译的时候会进行语法检查）/Dart语言允许弱类型语言式的编程
// 3>.Dart语言在运行前解析（指定数据类型和编译时常量）可以提高运行速度
// 4>.Dart语言的统一入口是main函数
// 5>.Dart语言的私有特性是在变量名或者函数名前面加上"_"
// 6>.Dart支持async/await异步处理

/// 9.Dart语言类型系统
// 1>.Dart语言是类型安全的（dart语言使用静态类型检查和动态类型检查以确保变量的值总是与变量的静态类型匹配）
// 2>.Dart语言中类型声明是可选的（因为会在编译时执行类型推导）
// 3>.num/double/int/String/List/Set/bool/Map/Object/dymamic/Function(/Symbol/runes)
// 4>.Dart语言中所有的类型都是对象（都继承自Object类）/在Dart语言中null类型也继承自Object类

 // 导入系统头文件
 import 'package:flutter/material.dart';


 void main() => runApp(MyApp());
 // 新建一个类
 // 类名首字母大写
 class MyApp extends StatelessWidget {
   // This widget is the root of your application.
   @override
   Widget build(BuildContext context) {
     return MaterialApp(
       title: 'Flutter Demo',
       theme: ThemeData(
         // This is the theme of your application.
         //
         // Try running your application with "flutter run". You'll see the
         // application has a blue toolbar. Then, without quitting the app, try
         // changing the primarySwatch below to Colors.green and then invoke
         // "hot reload" (press "r" in the console where you ran "flutter run",
         // or simply save your changes to "hot reload" in a Flutter IDE).
         // Notice that the counter didn't reset back to zero; the application
         // is not restarted.
         primarySwatch: Colors.blue,
       ),
       home: MyHomePage(title: 'Flutter Demo Home Page'),
     );
   }
 }

 class MyHomePage extends StatefulWidget {
   MyHomePage({Key key, this.title}) : super(key: key);

   // This widget is the home page of your application. It is stateful, meaning
   // that it has a State object (defined below) that contains fields that affect
   // how it looks.

   // This class is the configuration for the state. It holds the values (in this
   // case the title) provided by the parent (in this case the App widget) and
   // used by the build method of the State. Fields in a Widget subclass are
   // always marked "final".

   final String title;

   @override
   _MyHomePageState createState() => _MyHomePageState();
 }

 class _MyHomePageState extends State<MyHomePage> {
   int _counter = 0;

   void _incrementCounter() {
     setState(() {
       // This call to setState tells the Flutter framework that something has
       // changed in this State, which causes it to rerun the build method below
       // so that the display can reflect the updated values. If we changed
       // _counter without calling setState(), then the build method would not be
       // called again, and so nothing would appear to happen.
       _counter++;
     });
   }

   @override
   Widget build(BuildContext context) {
     // This method is rerun every time setState is called, for instance as done
     // by the _incrementCounter method above.
     //
     // The Flutter framework has been optimized to make rerunning build methods
     // fast, so that you can just rebuild anything that needs updating rather
     // than having to individually change instances of widgets.
     return Scaffold(
       appBar: AppBar(
         // Here we take the value from the MyHomePage object that was created by
         // the App.build method, and use it to set our appbar title.
         title: Text(widget.title),
       ),
       body: Center(
         // Center is a layout widget. It takes a single child and positions it
         // in the middle of the parent.
         child: Column(
           // Column is also a layout widget. It takes a list of children and
           // arranges them vertically. By default, it sizes itself to fit its
           // children horizontally, and tries to be as tall as its parent.
           //
           // Invoke "debug painting" (press "p" in the console, choose the
           // "Toggle Debug Paint" action from the Flutter Inspector in Android
           // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
           // to see the wireframe for each widget.
           //
           // Column has various properties to control how it sizes itself and
           // how it positions its children. Here we use mainAxisAlignment to
           // center the children vertically; the main axis here is the vertical
           // axis because Columns are vertical (the cross axis would be
           // horizontal).
           mainAxisAlignment: MainAxisAlignment.center,
           children: <Widget>[
             Text(
               'You have pushed the button this many times:',
             ),
             Text(
               '$_counter',
               style: Theme.of(context).textTheme.display1,
             ),
           ],
         ),
       ),
       floatingActionButton: FloatingActionButton(
         onPressed: _incrementCounter,
         tooltip: 'Increment',
         child: Icon(Icons.add),
       ), // This trailing comma makes auto-formatting nicer for build methods.
     );
   }
 }
