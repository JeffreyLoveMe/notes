import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/screenutil.dart';
// import 'dart:convert';
import '../service/service_method.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:url_launcher/url_launcher.dart';
/*
 首页Tab
 */
class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  var homePageContent = '正在获取数据';

  // 什么作用 - xxx
  // 什么时候调用 - xxx
  @override
  void initState() {
    // 这是一个异步方法
    // getHomePageContent().then((value) {
    //   // xxx
    //   // value - 表示‘异步方法getHomePageContent()’返回的数据
    //   setState(() {
    //     homePageContent = value.toString();
    //   });
    // }).whenComplete(() {
    //   // xxx
    // }).catchError(() {
    //   // xxx
    // });
    getHomePageContent().then((value) {
      setState(() {
        homePageContent = value.toString();
      });
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text('百姓生活+'),
        ),
        body: SingleChildScrollView(
          child: FutureBuilder(
            future: getHomePageContent(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              /*******************************************mock-start*******************************************/
              // 轮播图
              List<Map> swiper = List();
              swiper.add({'url':'https://cms-dumall.cdn.bcebos.com/cms_com_upload_pro/dumall_1588149639781.jpg?x-bce-process=image/quality,q_100/format,f_auto/interlace,i_progressive'});
              swiper.add({'url':'https://ss3.bdstatic.com/70cFv8Sh_Q1YnxGkpoWK1HF6hhy/it/u=3105985776,1507540069&fm=11&gp=0.jpg'});
              swiper.add({'url':'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1590391163768&di=4d4846387c0f24f310895a37c45ac1e2&imgtype=0&src=http%3A%2F%2Fimg1.cache.netease.com%2Fcatchpic%2F4%2F4A%2F4A8FF896FCBBF48048A13CE64024DE0E.jpg'});
              // 预置位
              List<Map> gridViews = List();
              gridViews.add({'image':'http://img0.egou.com/shop/201403/06/956b945a0c94466420f59f3d9bece7ff.gif', 'mallCategoryName':'白酒'});
              gridViews.add({'image':'http://img0.egou.com/shop/201403/06/956b945a0c94466420f59f3d9bece7ff.gif', 'mallCategoryName':'啤酒'});
              gridViews.add({'image':'http://img0.egou.com/shop/201403/06/956b945a0c94466420f59f3d9bece7ff.gif', 'mallCategoryName':'白酒'});
              gridViews.add({'image':'http://img0.egou.com/shop/201403/06/956b945a0c94466420f59f3d9bece7ff.gif', 'mallCategoryName':'啤酒'});
              gridViews.add({'image':'http://img0.egou.com/shop/201403/06/956b945a0c94466420f59f3d9bece7ff.gif', 'mallCategoryName':'白酒'});
              gridViews.add({'image':'http://img0.egou.com/shop/201403/06/956b945a0c94466420f59f3d9bece7ff.gif', 'mallCategoryName':'啤酒'});
              gridViews.add({'image':'http://img0.egou.com/shop/201403/06/956b945a0c94466420f59f3d9bece7ff.gif', 'mallCategoryName':'白酒'});
              gridViews.add({'image':'http://img0.egou.com/shop/201403/06/956b945a0c94466420f59f3d9bece7ff.gif', 'mallCategoryName':'啤酒'});
              gridViews.add({'image':'http://img0.egou.com/shop/201403/06/956b945a0c94466420f59f3d9bece7ff.gif', 'mallCategoryName':'白酒'});
              gridViews.add({'image':'http://img0.egou.com/shop/201403/06/956b945a0c94466420f59f3d9bece7ff.gif', 'mallCategoryName':'啤酒'});
              // 广告banner
              String adPicture = 'https://ss3.bdstatic.com/70cFv8Sh_Q1YnxGkpoWK1HF6hhy/it/u=3731741439,4057676812&fm=26&gp=0.jpg';
              String leaderImage = 'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1592387357068&di=e0ad555e810a49ec39fde51cd721d3f7&imgtype=0&src=http%3A%2F%2Fimg4.imgtn.bdimg.com%2Fit%2Fu%3D3628763969%2C2312222020%26fm%3D214%26gp%3D0.jpg';
              String leaderPhone = '15601749931';
              // UI布局
              return Column(
                children: <Widget>[
                  CustomSwiper(
                    swiperDateList: swiper
                  ),
                  HomeTopGridView(
                    gridViews: gridViews
                  ),
                  HomeAdBanner(
                    adPicture: adPicture
                  ),
                  LeaderPhone(
                    leaderImage: leaderImage, 
                    leaderPhone: leaderPhone
                  )
                ],
              );
              /*******************************************mock-end*******************************************/
              // // dis
              // if (snapshot.hasData) {
              //   var data = json.decode(snapshot.data.toString());
              //   List<Map> swiper = (data['data']['slides'] as List).cast();
              //   List<Map> gridViews = (data['data']['category'] as List).cast();
              //   String adPicture = data['data']['advertesPicture']['PICURE_ADDRESS'];
              //   String leaderImage = data['data']['shopInfo']['leaderImage'];
              //   String leaderPhone = data['data']['shopInfo']['leaderPhone'];
              //   return Column(
              //     children: <Widget>[
              //       CustomSwiper(
              //           swiperDateList: swiper
              //       ),
              //       HomeTopGridView(
              //           gridViews: gridViews
              //       ),
              //       HomeAdBanner(
              //         adPicture: adPicture
              //       ),
              //       LeaderPhone(
              //         leaderImage: leaderImage, 
              //         leaderPhone: leaderPhone
              //       )
              //     ],
              //   );
              // } else {
              //   return Center(
              //       child: Text(
              //         '加载中...',
              //         style: TextStyle(
              //             fontSize: ScreenUtil().setSp(28, allowFontScalingSelf: false)
              //        ),
              //      )
              //   );
              // }
            }
          )
        ),
      ),
    );
  }
}


// 轮播图
class CustomSwiper extends StatelessWidget {
  final List swiperDateList;
  // 构造函数 - 官方规定写法
  // 如果需要传入参数可以修改构造函数
  const CustomSwiper({Key key, this.swiperDateList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.brown,
      height: ScreenUtil().setHeight(333),
      width: ScreenUtil().setWidth(750),
      child: Swiper(
        // 构建数据源
        itemBuilder: (BuildContext context, int index) {
          return Image.network(
            '${swiperDateList[index]['url']}', 
          fit: BoxFit.cover
          );
        },
        // 有多少个轮播图
        itemCount: swiperDateList.length,
        // 指示器
        pagination: SwiperPagination(),
        // 是否自动播放
        autoplay: true,
      ),
    );
  }
}

// 广告banner
class HomeAdBanner extends StatelessWidget {

  final String adPicture;

  const HomeAdBanner({Key key, this.adPicture}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Image.network(adPicture),
    );
  }
}

// TopGridView
class HomeTopGridView extends StatelessWidget {
  // 新建属性
  final List gridViews;
  // 必须在这个方法中传入/可选参数
  const HomeTopGridView({Key key, this.gridViews}) : super(key: key);

  Widget _gridViewItemUI(BuildContext context, item) {
    // 可以增加跳转方法
    return InkWell(
      onTap: () {
        print('点击了gridView');
      },
      child: Column(
        children: <Widget>[
          Image.network(item['image'],width: ScreenUtil().setWidth(95)),
          Text(item['mallCategoryName'])
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // 处理数据
    // this可以省略
    if (this.gridViews.length > 10) {
      this.gridViews.removeRange(10, gridViews.length);
    }
    return Container(
      height: ScreenUtil().setHeight(250),
      padding: EdgeInsets.all(3.0),
       child: GridView.count(
         crossAxisCount: 5,
         padding: EdgeInsets.all(5.0),
         children: gridViews.map((item) {
           return _gridViewItemUI(context, item);
         }).toList(),
       )
    );
  }
}

// 店长电话
class LeaderPhone extends StatelessWidget {
  final String leaderImage;
  final String leaderPhone;

  const LeaderPhone({Key key, this.leaderImage, this.leaderPhone}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: InkWell(
        onTap: () {
          // 拨打电话
          // flutter插件地址 - https://github.com/flutter/plugins
          _launchURL();
        },
        child: Image.network(leaderImage),
      ),
    );
  }
  // ？？？Future/async/await的关系和用法？？？
  void _launchURL() async {
    String url = 'tel:'+ leaderPhone;
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'URL异常 => 不能访问';
    }
  }
}







// import 'package:flutter/material.dart';
// // 引入自定义的包
// import 'package:dio/dio.dart';

// /*
// flutter中网络请求
// 1.导入dio - 在pubspec.yaml中加入dio: ^3.0.9
// 2.导入dio文件 - import 'package:dio/dio.dart'
// 3.新建http请求方法 - 使用async/try {} catch (e) {}
// 4.get网络请求 - Dio().get('path');
// */

// // StatefulWidget - 表示该页面可以被数据动态驱动
// class HomePage extends StatefulWidget {
//   HomePage({Key key}) : super(key: key);

//   @override
//   _HomePageState createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {

//   var typeController = TextEditingController();
//   var showText = '欢迎您来到美好人间';

//   // 默认需要重载该方法 - 写UI
//   @override
//   Widget build(BuildContext context) {
//     // 如果可以完全有必要每个页面的最外层加一个Container
//     // 类似于iOS中对页面最外层包裹一个UIView
//     return Container(
//       // 如果一个页面有‘导航栏&中间页面&底部分栏’一般都需要Scaffold来构建页面
//       child: Scaffold(
//         appBar: AppBar(
//           title: Text('美好人间'),
//         ),
//         // 使用Container有利于构建页面
//         body: SingleChildScrollView(
//           child: Container(
//           // 垂直布局
//             child: Column(
//               // 哪些控件需要垂直布局
//               children: <Widget>[
//                 // 1.UITextField
//                 TextField(
//                   controller: typeController,
//                   // 装饰 - 实际就是样式（包括边框、内边距、外边距、圆角、字体样式）
//                   decoration: InputDecoration(
//                     contentPadding: EdgeInsets.all(10),
//                     labelText: '美女类型',
//                     // 提示文字
//                     helperText: '请输入你喜欢的类型',
//                   ),
//                   // 关闭自动聚焦
//                   autofocus: false,
//                 ),
//                 // 2.UIBUtton
//                 RaisedButton(
//                   // 按钮上文字
//                   child: Text('选择完毕'),
//                   // 点击事件
//                   onPressed: () {
//                     // 匿名函数
//                     _choiceAction();
//                 }),
//                 // 3.UILabel
//                 // 如果需要显示的文字不一样可以自定义变量var
//                 Text(
//                   showText,
//                   overflow: TextOverflow.ellipsis,
//                   maxLines: 1
//                 )
//               ]
//             )
//           )
//         )
//       )
//     );
//   }

//   // 这里需要一些操作
//   /*
//   dart是单线程语言 - 不可以开启新的线程工作
//   1>.在dart中进行类似的延迟操作可以采取异步的方式
//   2>.Future - 表示未来某一时间获取想要的对象的一种方式
//    */
//   Future getHttp(String text) async {
//     try {
//       Response response;
//       var data = {'name': text};
//       response = await Dio().get('https://www.easy-mock.com/mock/5c60131a4bed3a6342711498/baixing/dabaojian', 
//         queryParameters: data
//       );
//       return response.data;
//     } catch (e) {
//       return print(e);
//     }
//   }

//   // 一般私有方法都会使用'_'
//   void _choiceAction() {
//     print('开始选择你喜欢的类型..........');

//     if (typeController.text.toString() == '') {
//       showDialog(
//         context: context,
//         builder: (context) => AlertDialog(
//           title: Text('美女类型不能为空'),
//         )
//       );
//       return;
//     }

//     getHttp(typeController.text.toString()).then(
//       (value) {
//         setState(() {
//           showText = value['data']['name'].toString();
//         });
//       }
//     );
//   }
// }

// 静态组件
// class HomePage extends StatelessWidget {
//   const HomePage({Key key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     getHttp();
//     return Scaffold(
//       body: Container(
//         child: Center(
//           child: Text('商城首页')
//         ),
//       ),
//     );
//   }
  
//   // 在class中新建一个方法
//   void getHttp() async {
//     try {
//       // easyMock - https://www.easy-mock.com/mock/5c60131a4bed3a6342711498/baixing/dabaojian
//       Response response;
//       // 入参 - name
//       response = await Dio().get('https://www.easy-mock.com/mock/5c60131a4bed3a6342711498/baixing/dabaojian?name=小姐姐');
//       print(response);
//     } catch (e) {
//       return print(e);
//     }
//   }
// }