// 两种风格都引入到项目中
// 引入库 - 'package:xxx.dart'
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/screenutil.dart';
// 引入自定义文件
// 在一个包内部 - './xxx.dart'
import './home_page.dart';
import './category_page.dart';
import './cart_page.dart';
import './member_page.dart';

/*
 第一个页面
 1.负责App的整体样式
 2.负责初始化操作
 */
// 因为底部BottomNavigationBarItem会变化所有必须使用StatefulWidget
class IndexPage extends StatefulWidget {
  IndexPage({Key key}) : super(key: key);

  @override
  _IndexPageState createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> {
  // 表示这是一个不变的List
  // BottomNavigationBarItem - 底部分栏
  final List<BottomNavigationBarItem> bottomTabs = [
    BottomNavigationBarItem(
      icon: Icon(CupertinoIcons.home),
      title: Text('首页')
    ),
    BottomNavigationBarItem(
      icon: Icon(CupertinoIcons.search),
      title: Text('分类')
    ),
    BottomNavigationBarItem(
      icon: Icon(CupertinoIcons.shopping_cart),
      title: Text('购物车')
    ),
    BottomNavigationBarItem(
      icon: Icon(CupertinoIcons.profile_circled),
      title: Text('会员中心')
    )
  ];
  // 默认有哪些页面
  final List tabBodys = [
    HomePage(),
    CategoryPage(),
    CartPage(),
    MemberPage()
  ];

  int currentIndex = 0;
  var currentPage;

  @override
  void initState() {
    currentPage = tabBodys[currentIndex];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // 初始化操作
    // 像素 - iPhone6为基准
    ScreenUtil.init(context, width: 750, height: 1334);
    print('设备像素密度${ScreenUtil.pixelRatio}');
    print('设备的高${ScreenUtil.screenHeight}');
    print('设备的宽${ScreenUtil.screenWidth}');
    // 任何新页面都可以使用Scaffold
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 245, 245, 245),
      bottomNavigationBar: BottomNavigationBar(
        // 当前有多少Page
        items: bottomTabs,
        // 类型是什么样子
        type: BottomNavigationBarType.fixed,
        // 当前选中
        currentIndex: currentIndex,
        /**
         * 匿名函数
         * () {
         * 
         * }
         */
        onTap: (index) {
          // 刷新UI
          setState(() {
            currentIndex = index;
            currentPage = tabBodys[index];
          });
        },
      ),
      // 万物皆widget - 如果要求返回widget都可以抽离出去/新建class
      body: currentPage,
    );
  }
}