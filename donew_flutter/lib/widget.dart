import 'package:flutter/material.dart';

class DnWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return DmWidget();
  }
}

class DmWidget extends State<DnWidget> {

  List<String> list = List.generate(20, (index)=>'动脑学院');

  @override
  Widget build(BuildContext context) {
    
    // Scaffold/脚手架 - App框架
    return new Scaffold(
      // 导航栏
      appBar: AppBar(title: Text('动脑学院'),),
      // 容器
      body: ListView.builder(itemCount: list.length, itemBuilder: (context, index){
        // 这里有很多属性可以选择性写
        return Dismissible(
          key: Key(list[index]), 
          child: null, 
          );
      }),
    );
  }
}