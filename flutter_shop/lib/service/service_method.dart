import 'package:dio/dio.dart';
import 'dart:async';
import 'dart:io';
// 引入非同一个包的文件 - '../xxx.dart'
// '../'表示跳出当前文件夹
import '../config/service_url.dart';

// dart不要求方法必须写在函数内部
Future getHomePageContent() async {
  try {
    print('开始获取首页数据...');
    // 1.设置相关属性
    Dio dio = Dio();
    // as - 强制类型转换
    dio.options.contentType = ContentType.parse('application/x-www-form-urlencoded').toString();
    dio.options.responseType = ResponseType.plain;
    // 2.网络请求
    var formData = {'lon':'115.02932', 'lat':'35.76189'};
    Response response = await dio.post(servicePath['homePageContent'], data: formData);
    // 3.请求结束以后的处理
    if (response.statusCode == 200) {
      return response.data;
    } else {
      throw Exception('后端接口出现异常');
    }
  } catch (e) {
    return print('ERROR ==== $e');
  }
}