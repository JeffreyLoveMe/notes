// 跨平台解决方案
// 1>.Web/Hybrid - 基于web相关技术来实现界面和功能 - cordova
// 2>.jsCore - 通过JsCore桥接调用原生服务 - React Native/Weex
// 3>.Native - 将某个语言编译成二进制文件，生成动态库、打包成apk和iap - flutter

// 选择flutter的原因
// 1>.Web/Hybrid - UI性能差，功能性Api缺失
// 2>.RN - UI性能一般，开发体验差
// 3>.flutter - UI性能好，开发体验较好

// flutter概述
// 1>.概念 - flutter是google开发的移动UI框架。可以快速的在iOS/Android上构建高质量的原生用户界面
// 2>.特点 - flutter可以与现有的代码一起工作 ｜ flutter是完全免费、开源的
// 3>.兼容 - iOS/Android/wp/web
// 4>.组成 - Engine(C++) - Skia/Dart/Text ｜ Framework - Dart

// flutter详情
// 1>.dart语法编译 - dart是一种强类型、跨平台的客户端开发语言。具有专门为客户端优化、高生产力、快速高效、可移植易学的风格
// 2>.flutter插件 - dart语言无法直接调用Android系统提供的Java接口，需要使用flutter插件来实现中转
// 3>.Skia（siQ）图像处理引擎 - 2005年问世/用于Chrome浏览器/2007年被移植到Android平台
// 4>.开发电脑选择：mac(windows不能开发iOS)
// 5>.IDE选择：Android Studio > VsCode

// flutter环境搭建
/*
 一.flutter环境准备
 1>.打开官网https://flutter.io
 2>.点击Docs->点击Get Started->选择macOS
 3>.下载flutterSDK（以后flutter升级直接可以用命令行）
 4>.将下载完成的flutterSDK放在某个位置（例如 - /Applications/flutter）
 二、开始配置环境变量
 1>.vim ~/.bash_profile
 2>.写入一下语句
 '''
 // 配置环境变量
 export PATH=/Applications/flutter/bin:$PATH
 // 针对国内用户 - 设置Flutter临时镜像（随时可以会换）
 export FLUTTER_STORAGE_BASE_URL=https://storage.flutter-io.cn
 export PUB_HOSTED_URL=https://pub.flutter-io.cn
 '''
 3>.source ~/.bash_profile
 4>.flutter doctor #检测flutter环境
 5>.在iOS上配置环境 - 下载Xcode/安装git/安装CocoaPods
 6>.Android Studio - Preferences - Plugins(下载Dart插件/Flutter插件)
 */
// 注意点
// 1>.shift + command + p - 打开控制器面板
// 2>.运行flutter项目之前可以使用“flutter doctor”命令行检测一下
// 3>.？？？怎么升级flutterSDK？？？1.终端输入flutter upgrade/2.直接下载flutterSDK覆盖
// 4>.Using Flutter in China - https://flutter.dev/community/china
// 5>.VSCode新建项目命令 - xxx是项目名称，必须小写
// flutter create -i swift -a kotlin xxx
// 6>.将项目导入到AS
// 将flutter项目导入AS中会自动引导AS安装Dart插件/Flutter插件
// 7>.flutter run - 运行项目
// 8>.flutter run -d 'iphone X' - 利用iphone X运行项目

// flutter项目文件
/*
 * dream_flutter - projectName
 * .dart_tool - 工具包
 * .idea - 环境配置
 ** android - 安卓包工程文件
 * build - xxx
 ** ios - iOS包工程文件
 ** lib - 主要工程目录（dart源文件）/可以包含其他资源文件
 * test - 测试相关文件
 * .gitignore - 忽略文件
 * .metadata - 元信息
 * .packages - 包信息
 * donewflutter.iml - xxx
 * pubspec.lock - xxx
 ** pubspec.yaml - 项目依赖配置文件（很重要）
 * README.md - 相关介绍文档
 */

// flutter中怎么归档资源文件
// 1>.Android中将resources/assets区别对待/iOS中将images和assets区别对待
// 2>.flutter中认为所有的资源都会被作为assets对待
// 3>.flutter中的assets文件夹可以是任意文件夹（只要在pubspec.yaml中声明）
/*
assets:
# 这里只需要声明一个就行
- images/dm_main_logo.png
*/
/*
项目中怎么使用该图片
new Image.asset(images/dm_main_logo.png);
 */

// flutter中如何处理不同分辨率 - 与iOS一致遵循一个简单的基于像素密度的格式

// flutter中如何添加项目所需依赖
// 1>.在Android中可以使用Gradle文件来添加依赖项/在iOS中通常把依赖项添加到Podfile中
// 2>.flutter使用dart构建系统和pub包管理器来处理依赖
/*
dependencies:
  flutter:
    sdk: flutter
    google_sign_in: ^3.0.3
*/
/*
注意：
1.虽然flutter项目中的Android文件夹下有一个Gradle文件，但是只有在添加平台相关所需要的依赖关系时才使用这些文件。否则应该使用pubspec.yaml来声明用于flutter的外部依赖项
2.如果flutter项目中的iOS文件夹下有Podfile文件，但是只有在添加平台相关所需要的依赖关系时才使用这些文件。否则应该使用pubspec.yaml来声明用于flutter的外部依赖项
*/

// FIMXE - 复习到这里
/*第一个程序start*/
// import 'package:flutter/material.dart';  // 必须使用‘;’结尾

// // void main() => runApp(MyApp());  // 只有一行使用 =>
// void main() {
//   runApp(MyApp());
// }

// Flutter的基本项目代码
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       // 属性以‘,’结尾
//       title: 'Welcome to Flutter',
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text('Welcome to Flutter'),
//         ),
//         body: Center(
//           child: Text('Helllo World'),
//         ),
//       ),
//     );
//   }
// }

// /*
// r - 热更新
// p - 显示网格
// o - 切换安卓/iOS样式
// q - 退出
//  */
/*第一个程序end*/

// flutter打包
// 安卓打包 - flutter build apk
// iOS打包 - xxx

/*自动生成代码start*/
// import 'package:flutter/material.dart';

// void main() {
//   runApp(MyApp());
// }

// flutter中状态管理
// 1>.什么是状态state -构建widget时可以同步读取的信息/在widget生命周期中可以更改的信息
// 2>.怎么管理状态 - 利用statefulWidget
//

// // 新建一个类 - 类名首字母大写
// /*
//  * StatelessWidget - 死控件/不会随数据动态改变/无状态
//  * StatefulWidget - 活控件/会随数据动态改变/有状态
//  */
// class MyApp extends StatelessWidget {
//   // 万物皆Widget
//   // 选中 -> command -> 内部实现
//   /*
//   widget之间使用;
//   参数之间使用,
//   */
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         // This is the theme of your application.
//         //
//         // Try running your application with "flutter run". You'll see the
//         // application has a blue toolbar. Then, without quitting the app, try
//         // changing the primarySwatch below to Colors.green and then invoke
//         // "hot reload" (press "r" in the console where you ran "flutter run",
//         // or simply save your changes to "hot reload" in a Flutter IDE).
//         // Notice that the counter didn't reset back to zero; the application
//         // is not restarted.
//         primarySwatch: Colors.blue,
//         // This makes the visual density adapt to the platform that you run
//         // the app on. For desktop platforms, the controls will be smaller and
//         // closer together (more dense) than on mobile platforms.
//         visualDensity: VisualDensity.adaptivePlatformDensity,
//       ),
//       home: MyHomePage(title: 'Flutter Demo Home Page'),
//     );
//   }
// }

// class MyHomePage extends StatefulWidget {
//   MyHomePage({Key key, this.title}) : super(key: key);

//   // This widget is the home page of your application. It is stateful, meaning
//   // that it has a State object (defined below) that contains fields that affect
//   // how it looks.

//   // This class is the configuration for the state. It holds the values (in this
//   // case the title) provided by the parent (in this case the App widget) and
//   // used by the build method of the State. Fields in a Widget subclass are
//   // always marked "final".

//   final String title;

//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   int _counter = 0;

//   void _incrementCounter() {
//     setState(() {
//       // This call to setState tells the Flutter framework that something has
//       // changed in this State, which causes it to rerun the build method below
//       // so that the display can reflect the updated values. If we changed
//       // _counter without calling setState(), then the build method would not be
//       // called again, and so nothing would appear to happen.
//       _counter++;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     // This method is rerun every time setState is called, for instance as done
//     // by the _incrementCounter method above.
//     //
//     // The Flutter framework has been optimized to make rerunning build methods
//     // fast, so that you can just rebuild anything that needs updating rather
//     // than having to individually change instances of widgets.
//     return Scaffold(
//       appBar: AppBar(
//         // Here we take the value from the MyHomePage object that was created by
//         // the App.build method, and use it to set our appbar title.
//         title: Text(widget.title),
//       ),
//       body: Center(
//         // Center is a layout widget. It takes a single child and positions it
//         // in the middle of the parent.
//         child: Column(
//           // Column is also a layout widget. It takes a list of children and
//           // arranges them vertically. By default, it sizes itself to fit its
//           // children horizontally, and tries to be as tall as its parent.
//           //
//           // Invoke "debug painting" (press "p" in the console, choose the
//           // "Toggle Debug Paint" action from the Flutter Inspector in Android
//           // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
//           // to see the wireframe for each widget.
//           //
//           // Column has various properties to control how it sizes itself and
//           // how it positions its children. Here we use mainAxisAlignment to
//           // center the children vertically; the main axis here is the vertical
//           // axis because Columns are vertical (the cross axis would be
//           // horizontal).
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             Text(
//               'You have pushed the button this many times:',
//             ),
//             Text(
//               '$_counter',
//               style: Theme.of(context).textTheme.headline4,
//             ),
//           ],
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: _incrementCounter,
//         tooltip: 'Increment',
//         child: Icon(Icons.add),
//       ), // This trailing comma makes auto-formatting nicer for build methods.
//     );
//   }
// }
/*自动生成代码end*/

/*组件学习start*/
// flutter一切皆Widget
import 'package:flutter/material.dart'; // 引入库

void main() => runApp(
    MyApp(items: new List<String>.generate(1000, (index) => 'Item $index')));

/*
StatelessWidget - 适用于当我们描述的用户界面不依赖于对象中的配置信息/无状态的widget
StatefulWidget - 动态更新UI/具有state对象存储状态数据并将其传递到树重建中
*/
class MyApp extends StatelessWidget {
  // 1.声明一个List
  final List<String> items;

  MyApp({Key key, @required this.items}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // 层叠布局
    // var stack = new Stack(
    //   // 0 - 1
    //   // 只能相对于两个控件
    //   alignment: const FractionalOffset(0, 1),
    //   children: <Widget>[
    //     new CircleAvatar(
    //       backgroundImage: new NetworkImage('http://blogimages.jspang.com/blogtouxiang1.jpg'),
    //       radius: 100.0,
    //     ),
    //     // new Container(
    //     //   decoration: new BoxDecoration(
    //     //     color: Colors.lightBlue
    //     //   ),
    //     //   padding: const EdgeInsets.all(10.0),
    //     //   child: Text('jsPang 技术胖'),
    //     // )
    //     // 绝对布局 - 特别灵活
    //     new Positioned(
    //       child: new Text('jsPang'),
    //       top: 10.0,
    //       left: 10.0,
    //     ),
    //     new Positioned(
    //       child: new Text('jsPang.com'),
    //       right: 10.0,
    //       bottom: 10.0,
    //     ),
    //   ],
    // );

    // // card布局
    // var card = new Card(
    //   child: Column(
    //     children: <Widget>[
    //       ListTile(
    //         title: Text(
    //           'jspang',
    //           style: TextStyle(fontWeight: FontWeight.w500)
    //         ),
    //         subtitle: Text('技术胖'),
    //         leading: new Icon(Icons.accessibility,color:Colors.lightBlue)
    //       ),
    //       ListTile(
    //         title: Text(
    //           'jspang',
    //           style: TextStyle(fontWeight: FontWeight.w500)
    //         ),
    //         subtitle: Text('技术胖'),
    //         leading: new Icon(Icons.accessibility,color:Colors.lightBlue)
    //       ),
    //       ListTile(
    //         title: Text(
    //           'jspang',
    //           style: TextStyle(fontWeight: FontWeight.w500)
    //         ),
    //         subtitle: Text('技术胖'),
    //         leading: new Icon(Icons.accessibility,color:Colors.lightBlue)
    //       ),
    //     ],
    //   ),
    // );

    /*
    * 命令式UI - 手动构建全功能UI实体，然后在UI更改时使用方法对其进行变更/在旧的上进行修改
    * 声明式UI - widget会在自身上触发重建并构建一个新的widget子树/生成新的
    * */
    // widget具有不同性 - 每当widget状态发生改变的时候就会创建一个新的widget
    // https://www.jianshu.com/p/88c66747eec1
    return MaterialApp(
      title: 'text widget',
      // home的含义？？？
      home: Scaffold(
        // 导航栏
        appBar: new AppBar(
          title: new Text('Flutter Demo'),
        ),
        // // 页面 - 具体内容
        // body: Center(
        //   // // 1.Text - 类似UILabel
        //   // child: Text(
        //   //   // 文字
        //   //   '这是谁？这是谁？这是谁？这是谁？这是谁？',
        //   //   // 对其方式
        //   //   textAlign: TextAlign.center,
        //   //   // 最大行数
        //   //   maxLines: 1,
        //   //   // 字数过多溢出怎么处理
        //   //   overflow: TextOverflow.clip,
        //   //   // 字体样式
        //   //   style: TextStyle(
        //   //     // 字体大小
        //   //     fontSize: 25.0,
        //   //     // 字体颜色
        //   //     color: Color.fromARGB(255, 255, 125, 125),
        //   //     // 下划线
        //   //     decoration: TextDecoration.underline,
        //   //     // 下划线样式
        //   //     decorationStyle: TextDecorationStyle.double,
        //   //   ),
        //   // ),

        //   // // 2.Container - 类似div/UIView
        //   // // 属性之间的‘,’不能减少/最后一个属性省略‘,’
        //   // child: Container(
        //   //   // 子试图
        //   //   child: new Text('hello jsPang', style: TextStyle(fontSize: 40.0)),
        //   //   // 文字在容器中的位置
        //   //   alignment: Alignment.topLeft,
        //   //   // 宽度
        //   //   width: 350.0,
        //   //   // 高度
        //   //   height: 400.0,
        //   //   // // 背景颜色
        //   //   // color: Colors.red,
        //   //   // 内边距 - 容器与容器子元素（文字/图片）之间的距离
        //   //   padding: const EdgeInsets.fromLTRB(10, 15, 15, 10),
        //   //   // 外边距 - 容器与父试图之间的距离
        //   //   margin: const EdgeInsets.all(10.0),
        //   //   // decoration - 装饰
        //   //   decoration: new BoxDecoration(
        //   //     // 渐变颜色 - 不能与“背景颜色”共存/会抛出异常
        //   //     gradient: const LinearGradient(colors: [Colors.red, Colors.black, Colors.blue]),
        //   //     border: Border.all(width:2.0, color: Colors.red),
        //   //   ),
        //   // )

        //   // // 3.Image - 图片
        //   // // Image.asset() - 项目图片（常用）
        //   // // Image.file() - 本地图片
        //   // // Image.memory() - 内存图片
        //   // // Image.network() - 网络图片（常用）
        //   // child: Container(
        //   //   child: new Image.network(
        //   //     // src - 资源路径
        //   //     'https://pics3.baidu.com/feed/ca1349540923dd54c1589d6d977805d89c824807.jpeg?token=c818dc30edfcb1df8e619903be34b251',
        //   //     /*
        //   //     BoxFit.contain - xxx
        //   //     BoxFit.fill - 填满/会变形
        //   //     BoxFit.fitWidth - 横向按比例填满（竖向可能会超出）
        //   //     BoxFit.fitHeight - 竖向按比例填满（横向可能会超出）
        //   //     BoxFit.cover - 按比例填满
        //   //     BoxFit.scaleDown - 不能改变原图大小
        //   //      */
        //   //     fit: BoxFit.cover,
        //   //     // 图片混合颜色
        //   //     color: Colors.greenAccent,
        //   //     colorBlendMode: BlendMode.darken,
        //   //     // 图片重复
        //   //     // ImageRepeat.noRepeat - 不重复（默认）
        //   //     // ImageRepeat.repeat - 重复（以中间为基础）
        //   //     // ImageRepeat.repeatX - 横向重复
        //   //     // ImageRepeat.repeatY - 竖向重复
        //   //     repeat: ImageRepeat.repeatY,
        //   //   ),
        //   //   width: 300.0,
        //   //   height: 300.0,
        //   //   color: Colors.red
        //   // ),
        // ),

        // 4.ListView
        // 1>.静态ListView
        // body: new ListView(
        //   children: <Widget>[
        //     // 第一种写法
        //     // new ListTile(
        //     //   leading: new Icon(Icons.perm_camera_mic),
        //     //   title: new Text('perm_camera_mic'),
        //     // ),
        //     // new ListTile(
        //     //   leading: new Icon(Icons.perm_contact_calendar),
        //     //   title: new Text('perm_camera_mic'),
        //     // ),
        //     // new ListTile(
        //     //   leading: new Icon(Icons.perm_data_setting),
        //     //   title: new Text('perm_camera_mic'),
        //     // ),
        //     // // 第二种写法
        //     // new Image.network('https://cms-dumall.cdn.bcebos.com/cms_com_upload_pro/dumall_1588149639781.jpg?x-bce-process=image/quality,q_100/format,f_auto/interlace,i_progressive'),
        //     // new Image.network('https://ss3.bdstatic.com/70cFv8Sh_Q1YnxGkpoWK1HF6hhy/it/u=3105985776,1507540069&fm=11&gp=0.jpg'),
        //     // new Image.network('https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1590391163768&di=4d4846387c0f24f310895a37c45ac1e2&imgtype=0&src=http%3A%2F%2Fimg1.cache.netease.com%2Fcatchpic%2F4%2F4A%2F4A8FF896FCBBF48048A13CE64024DE0E.jpg')
        //     // new Image.asset(images/dm_main_logo.png);
        //   ],
        // ),

        // // 2>.万物皆组件
        // body: Center(
        //   child: Container(
        //     height: 200.0,
        //     child: MyListView()
        //   ),
        // ),

        // // 3>.动态列表
        // body: new ListView.builder(
        //   itemBuilder: (context, index) {
        //     return new ListTile(
        //       title: Text('$items[index]'),
        //       onTap: (){
        //         // 点击事件
        //         print('');
        //       },
        //     );
        //   },
        //   itemCount: items.length,
        // )

        // // 5.GridView
        // // 1>.静态GridView
        // body: GridView.count(
        //   // 1.内边距
        //   padding: const EdgeInsets.all(20.0),
        //   // 2.网格之间的间距（横轴）
        //   crossAxisSpacing: 10.0,
        //   // 3.网格之间的间距（竖轴）
        //   mainAxisSpacing: 5.0,
        //   // 4.宽/高
        //   childAspectRatio: 2.0,
        //   // 5.每行显示几个网格
        //   crossAxisCount: 3,
        //   // 6.共有几个网格
        //   children: <Widget>[
        //     const Text('I am JSpang'),
        //     const Text('I am JSpang'),
        //     const Text('I am JSpang'),
        //     const Text('I am JSpang'),
        //     const Text('I am JSpang'),
        //     const Text('I am JSpang'),
        //     const Text('I am JSpang'),
        //   ],
        // ),

        // 布局
        // 1>.水平布局 - Row
        // body: new Row(
        //   // 主轴对齐方法
        //   mainAxisAlignment: MainAxisAlignment.center,
        //   // 副轴对齐方法
        //   crossAxisAlignment: CrossAxisAlignment.end,
        //   children: <Widget>[
        //     // 灵活的布局
        //     Expanded(child: new RaisedButton(
        //       onPressed: (){},
        //       color: Colors.red,
        //       child: new Text('红色按钮'),
        //       ),
        //     ),
        //     Expanded(child: new RaisedButton(
        //       onPressed: (){},
        //       color: Colors.blue,
        //       child: new Text('蓝色按钮'),
        //       ),
        //     ),
        //     Expanded(child: new RaisedButton(
        //       onPressed: (){},
        //       color: Colors.orange,
        //       child: new Text('橙色按钮'),
        //       ),
        //     ),
        //     Expanded(child: new RaisedButton(
        //       onPressed: (){},
        //       color: Colors.yellow,
        //       child: new Text('黄色按钮'),
        //       ),
        //     ),
        //   ],
        // ),

        // // 2>.垂直布局 - Column
        // body: Center(
        //   child: Column(
        //     // 对齐方法
        //     // 垂直布局 - 主轴就是垂直方法/副轴就是水平方法
        //     crossAxisAlignment: CrossAxisAlignment.end,   // 相对与控件居中
        //     mainAxisAlignment: MainAxisAlignment.center,  // 相对于屏幕
        //     children: <Widget>[
        //       Text('I am JSpang'),
        //       Text('My website is jspang.com'),
        //       Text('I love coding'),
        //     ],
        //   ),
        // ),

        // // 3>.层叠布局
        // body: Center(
        //   child: stack,
        // ),

        // // 4.card布局
        // body: Center(
        //   child: card,
        // ),

        // 导航
        body: Center(
            // 按钮
            child: Button()),
      ),
    );
  }
}

// class MyListView extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return ListView(
//       // 滑动方法 - 水平方法
//       scrollDirection: Axis.horizontal,
//       children: <Widget>[
//         new Image.network('https://cms-dumall.cdn.bcebos.com/cms_com_upload_pro/dumall_1588149639781.jpg?x-bce-process=image/quality,q_100/format,f_auto/interlace,i_progressive'),
//         new Image.network('https://ss3.bdstatic.com/70cFv8Sh_Q1YnxGkpoWK1HF6hhy/it/u=3105985776,1507540069&fm=11&gp=0.jpg'),
//         new Image.network('https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1590391163768&di=4d4846387c0f24f310895a37c45ac1e2&imgtype=0&src=http%3A%2F%2Fimg1.cache.netease.com%2Fcatchpic%2F4%2F4A%2F4A8FF896FCBBF48048A13CE64024DE0E.jpg')
//       ],
//     );
//   }
// }

class Button extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      onPressed: () {
        // 点击事件
        // // MaterialPageRoute - 路由组件
        // Navigator.push(context, MaterialPageRoute(
        //   builder: (contxt) => new SecondScreen(productId: '1234567890')
        // ));
        _jumpSecondScreen(context);
      },
      child: Text('查看商品详情页'),
    );
  }

  // 私有方法
  _jumpSecondScreen(BuildContext context) async {
    // 获取方法的result
    final result = await Navigator.push(
        context,
        MaterialPageRoute(
            builder: (contxt) => new SecondScreen(productId: '1234567890')));
    // Toast
    Scaffold.of(context).showSnackBar(SnackBar(content: Text('$result')));
  }
}

class SecondScreen extends StatelessWidget {
  // 接收参数
  final String productId;
  // 构造函数 - 这是什么写法？？？
  /*
  * @required - 表示参数是必选的
  * : super(key:key) - 表示调用父类
  * */
  SecondScreen({Key key, @required this.productId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('商品详情页')),
        body: Center(
            child: RaisedButton(
          onPressed: () {
            // 点击事件
            // Navigator.pop(context);
            // 带参数回来
            Navigator.pop(context, this.productId);
            print(this.productId);
          },
          child: Text('返回'),
        )),
      ),
    );
  }
}
/*组件学习end*/
