// flutter填坑之旅 - https://blog.csdn.net/qq_34817440/article/details/99696016
// https://me.csdn.net/qq_34817440
void main() {
  /// 1.变量的声明 - 在Dart语言中变量的声明有3种方式
  // 1>.第一种方式 - 使用var（推荐使用）
  // 未初始化的变量声明 - 没有初始化的变量自动获取一个默认值null(包括bool)
  // 如果没有初始化值可以变成任何类型
  var m1; 
  m1 = 1;
  m1 = 'ab';  // 语言结束以 ";" 结尾/字符串可以使用''/""
  // 如果有初始化值声明的变量类型固定不能改变
  var m2 = 'ab'; // 支持类型推导 - 类似swift
  // m2 = 1;  // 报错
  print(m2);
  // 2>.第二种方式 - 使用Object（不推荐使用）
  // 动态任意类型/声明的变量类型可以改变/编辑的时候会检查类型
  Object m3 = 123;
  m3 = 'ab';
  // m3.test(); // 报错 - 编辑的时候会检查类型
  // 3>.第三种方式 - 使用dynamic（类似oc种的id类型）
  // 动态任意类型/声明的变量类型可以改变/编译的时候不检查类型
  dynamic m4 = 123;
  m4 = 'ab';
  // m4.test(); // 编译不报错/运行报错 - 编译的时候不检查类型
  // 4>.第四种方式 - 使用默认类型（类似java）
  String m5 = 'ab';
  // m5 = 123; // 报错
  /**
   * 问题 - var/Object/dynamic都可以声明变量，它们的区别是什么？
   * var - 如果没有初始化值可以变成任何类型/如果有初始化值声明的变量类型固定不能改变
   * Object - 动态任意类型/声明的变量类型可以改变/编辑的时候会检查类型
   * dynamic - 动态任意类型/声明的变量类型可以改变/编译的时候不检查类型
   */


  /// 2.常量声明 - 使用final和const
  // 第一、final和const的共同点
  // 1>.常量声明可以省略常量类型
  final String m6 = 'ab';
  // // 2>.常量初始化以后不能再次赋值
  // m6 = '123'; // 报错
  final m7 = 'ab';
  const String m8 = 'ab';
  const m9 = 'ab';
  // // 2>.不能与var一起使用（跟swift一样：var代表变量）
  // final var m10 = 'ab'; // 报错
  // const var m10 = 'ab'; // 报错
  // 第二、final和const的区别
  // 1>.类级别常量使用static const
  // 2>.const可以使用其他const常量的值来初始化其值
  const width = 100;
  const height = 100;
  const square = width * height;
  print(square);
  // 3>.使用const赋值声明（const可以省略）
  // 第二个const可以省略
  var list1 = const [1, 2, 3];  // list1数组可以修改/list1[x]元素不能修改
  const list2 = const [1, 2, 3]; // list1数组不能修改/list1[x]元素不能修改
  final list3 = const [1, 2, 3]; // list1数组不能修改/list1[x]元素不能修改
  // 4>.可以更改非final/非const变量的值（即使曾经具有const值）
  // 5>.const导致的不可变性是可传递的（子类会继承）
  // 6>.相同的const常量不会在内存中重复传递
  // 7>.const需要是编译时常量
  print(identical(list2, list3)); // 判断两个对象是否一致/返回true - 表示常量指向同一块内存


  /// 3.内置类型（常用数据类型）
  // 1>.数值类型/num、int、double - int/double的父类
  num m11 = 10;
  m11 = 11.0;
  int m12 = 10;
  double m13 = 9.80;
  // 2>.字符串类型/String - 可以使用''或者""
  String m14 = '123';
  String m15 = "ab";
  String m16 = m14 + m15;
  print(m16);
  // ‘’‘ string ’‘’可以定义多行字符串
  String m17 = '''
    abc
    abc
    abc
  ''';
  print(m17);
  // 3>.布尔类型/bool - 默认为null，不为false/默认为null，不为false/默认为null，不为false
  bool isNull;
  if (isNull) {
    print('不能进入');
  }
  // 4>.数组/List - 下标从0开始/支持泛型
  // // 此处new可以省略 - swift写法
  // List ls = new List();
  // 默认不指定长度可以无限添加/默认指定长度不可以无限添加
  List ls = List(); // 不推荐使用
  ls.add('ab');
  ls.add('ab');
  ls.add('ab');
  ls.add('ab');
  ls.first();
  var s = <String>[]; // 推荐使用（与swift一致）
  // 5>.字典/Map - 与java类似
  Map map = Map<String, Object>(); // 不推荐使用
  map['key'] = 'zero';
  var m = <String, Object>{}; // 推荐使用（与swift一致）
  m['key'] = 'zero';
  // 6>.集合Set
  Set oneSet = Set();
  oneSet.addAll([1, 2, 3, 4]);
  Set twoSet = Set();
  twoSet.addAll([1, 2, 5, 6]);
  // 补集 - 存在于set1中 & 不存在于set2中
  var difference = oneSet.difference(twoSet);
  print(difference);
  // 交集 - 存在于set1中 & 存在于set2中
  var intersection = oneSet.intersection(twoSet);
  print(intersection);
  // 并集 - 存在于set1中 || 存在于set2中
  var union = oneSet.union(twoSet);
  print(union);
  // 7>.Runes
  Runes runes = Runes('');
  var s1 = String.fromCharCodes(runes);
  print(s1);
  // 8>.Function - 函数也是对象/函数也是对象/函数也是对象
  // 9.枚举
  // 枚举类型是一种特殊的类，通常用来表示相同类型的一组常量
  // 枚举不能被继承，不能创建实例
  // enum ResponseState {
  //   Success,
  //   Error,
  //   Failure
  // }
  // 时间处理
  // 1>.获取当前时间
  DateTime.now();
  // 2>.创建一个指定时间年月日的DateTime对象
  DateTime(2009,03,3);
  // 3>.解析日期字符串
  DateTime.parse('2019-03-02');
  // 4>.解析时间戳
  DateTime.fromMillisecondsSinceEpoch(15516161200000);


  /// 4.函数
  // 1>.可以方法中写方法
  int tDemo() {
  return 0;
  }
  tDemo();
  // 2>.如果表达式中只有一行语句可以使用"=>"
  // return省略
  int tSum(int a, int b) => a + b;
  tSum(1, 2);
  void tLog() => print('c');
  tLog();
  // 3>.可选参数"{}"
  int tClick({int a, int b}) {
    return a + b;
  }
  tClick();
  tClick(a: 1);
  tClick(b: 2);
  tClick(a: 1, b: 2);
  // 4>.可选位置参数
  int tAdd(int a, [int b, int c]) {
    return a + b + c;
  }
  tAdd(1);
  tAdd(1, 5);
  tAdd(1, 5, 9);
  // 5>.可选命名默认参数
  int defaultClick({int a = 1, int b = 3}) {
    return a + b;
  }
  defaultClick(a: 5);
  // 6>.可选位置默认参数
  int defaultAdd(int a, [int b = 1, int c = 2]) {
    return a;
  }
  defaultAdd(1);
  // 7>.参数是List/？？？
  void cloud({List ls = const [1, 2, 3]}) {

  }
  cloud();
  // 8>.匿名函数
  // (name) - 参数
  // print('$name') - 代码块
  var mName = (name) => print('$name'); // 有参匿名函数
  var sName = () => print(''); // 无参匿名函数
  // 一个函数做为另一个函数参数
  // String - 函数返回类型
  // func - 函数名称/自定义 - 形参
  // str - 函数入参
  void sLogger(String func(str)) {

  }
  sLogger(mName);
  void state(String func()) {

  }
  state(sName);
  // 9>.函数别名 - ？？？

  
  /// 5.闭包 - 返回一个函数/函数也是一个对象
  Function makeAdd(int a, int b) {
    return (int y) => a + y;
  }
  // 接收一个函数
  var addFunc = makeAdd(10, 12);
  // 打印结果
  print(addFunc(12));
  

  /// 6.操作符号
  // ?. - 可选类型
  String str;
  print(str?.length);
  // ~/ - 取整（干掉小数点后面的）= 实际上就是商（余数直接省略）
  print(1 / 2);
  print(1 ~/ 2);
  // as is is!
  // as - 类型转换
  num n = 1;
  num n1 = 1.0;
  int i = n as int;
  // is - 是否是
  print(n1 is int);
  // is! - 是否不是
  print(i is double);
  // 三目运算符
  // ?? - isGo是否是Null（如果不是Null - isGo）
  // 与swift一样
  bool isGo = false;
  isGo = isGo ?? false;
  isGo ??= false;

  // 多继承
  var p = Person();
  p.showInfo();
  
  /// 7.流程控制语句
  
  /// 8.异常处理
  // 1>.概念 - 在dart语言中有两种异常（exception/error）
  // 2>.抛出异常
  // // 1.可以抛出exception/new可以省略
  // throw new FormatException('格式化错误');
  // // 2.可以抛出error/new可以省略
  // throw new NullThrownError();
  // // 3.可以抛出任意非null对象
  // throw '这是一个异常';
  // 3.捕获异常
  // 1.第一种写法
  try {
    // 异常代码
    throw new FormatException();
  } on Exception {
    // 如果是exception会进入这里/如果是error不会进入这里
    print('exception类型异常被捕获');
  } catch(e, s) {
    // 异常对象
    print(e);
    // stackTrace对象
    print(s);
  }
  // 2.第二种写法
  try {
    throw new NullThrownError();
  } on Error {
    print('error类型异常被捕获');
  } catch(e, s) {
    // 异常对象
    print(e);
    // stackTrace对象
    print(s);
  }
  // 3.第三种写法
  try {
    throw new NullThrownError();
  } catch(e, s) {
    // 异常对象
    print(e);
    // stackTrace对象
    print(s);
  }

  /// 10.类的构造函数
  // 1.命名构造函数
  // 2.重定向构造函数
  // 16m45s
}

/// 9.面向对象
// 1>.Dart语言是一个面向对象语言。同时支持基于Mixin的继承机制。
// 2>.每个对象都是一个类的实例，所有类都继承于Object
// 3>.基于Mixin的继承意味着每个类（Object除外）都只有一个超类
// 4>.一个类的代码可以在其他多个类继承中重复使用，从而达到多重继承的效果
// 新建一个类
abstract class Animal {
  // 新建一个方法
  void say() {
    print('我会说话');
  }
}
class PersonInfo {
  // "_"表示私有
  String _url;
  String _method;

  // 为什么不需要返回值
  PersonInfo(this._url, [this._method = 'GET']) {
    print('');
  }

  void showInfo() {
    print('url is $_url/method is $_method');
  }
}
class Sperson {
  void showInfo() {
    
  }
}
// 继承于上一个类 - 多继承
class Person extends Animal with Sperson {
  // 重写父类方法
  @override
  void say() {
    super.say();
  }
}