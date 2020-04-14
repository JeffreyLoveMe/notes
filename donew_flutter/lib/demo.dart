 import 'dart:ffi';

void main() {
  /// 1.变量的声明
  /**
   * var/dynamic/Object都可以声明变量，它们的区别是什么？
   * var - 如果没有初始化值可以变成任何类型/如果有初始化值声明的变量类型固定不能改变
   * dynamic - 动态任意类型/声明的变量类型可以改变/编辑的时候不检查类型
   * Object - 动态任意类型/声明的变量类型可以改变/编辑的时候会检查类型
   */
  /**
   * 1.没有初始化的变量自动获取一个默认值null
   * 2.在Dart语言中一切皆对象，对象默认值为null
   */
  // 未初始化的变量声明
  var m1;
  m1 = 1;
  m1 = 'aaa';
  // 初始化变量声明
  // 可以类型推倒
  var m2 = 123;
  // m2 = '123'; // 错误
  dynamic m3 = 123;
  m3 = '123'; // 正确
  m3.test(); // 编译不检查类型/运行报错
  Object m4 = 123;
  m4 = '123'; // 正确
  // m4.test(); // 编译检查类型
  /**
   * var > Object > dynamic
   */
  String m5 = '123';
  

  /// 2.常量 - final和const的区别
  // 共同点
  // 1>.声明变量的时候“变量类型可以省略”/常量可以省略类型
  final s1 = 'ninghao';
  final String s2 = 'ninghao';
  // // 2>.初始化后不能再赋值 - 表示常量
  // s1 = 'nh';
  // // 3>.不能与var一起使用
  // const var s3 = 'ninghao';
  /**
   * 区别
   * 1>.类级别常量使用static const
   * 2>.const可以使用其他const常量的值来初始化其值
   * 3>.使用const赋值声明（cons可以省略）
   * 4>.可以更改非final/非const变量的值（即使曾经具有const值）
   * 5>.const导致的不可变性是可传递的
   * 6>.相同的const常量不会在内存中重复传递
   * 7>.const需要是编译时常量
   */
  // const可以使用其他const常量的值来初始化其值
  const width = 100;
  const height = 100;
  const square = width * height;
  // 使用const赋值声明（cons可以省略）
  // 第二个const可以省略
  var list1 = const [1, 2, 3];
  const list2 = const [1, 2, 3];
  final list3 = const [1, 2, 3];
  list1[2] = 0;  // 不可以修改
  list1 = [2];   // 可以修改 - 正确
  list2[2] = 0;  // 不可以修改
  // list2 = [2];   // 不可以修改
  list3[2] = 0;  // 不可以修改
  // list3 = [2];   // 不可以修改


  /// 3.内置类型
  // 1>.Numbers数值 - int/double/num是int、double的父类
  int w = 10;
  double w1 = 0.9;
  // 2>.String字符串 - 可以使用'' / ""
  String w2 = 'ninghao';
  String w3 = "ninghao";
  String w4 = w2 + w3;
  print(w4);
  // ‘’‘ string ’‘’可以定义多行字符串
  String w5 = '''
    ninghao
    ninghao
    ninghao
    ninghao
  ''';
  StringBuffer sb = StringBuffer();
  // 两者是等价的
  sb.write('dg');
  sb.write('da');
  // 链式调用
  sb..write('dg')..write('da');
  // 3>.bool - 默认值为null
  bool isNull;
  if (isNull) {
    print('不能进入');
  }
  // 4>.List - 数组/下标从0开始/支持泛型
  // 默认不指定长度可以无限添加/默认指定长度不可以无限添加
  List ls = List();
  ls.add(123);
  ls.add(123);
  ls.add(123);
  ls.add(123);
  ls.first();
  // 40min
  // 5>.Map - 与java类似
  // 6>.Set
  Set set1 = Set();
  set1.addAll([1, 2, 5, 6]);
  Set set2 = Set();
  set2.addAll([1, 2, 3, 4]);
  // 补集 - 存在于set1中 & 不存在于set2中
  var difference = set1.difference(set2);
  print(difference);
  // 交集 - 存在于set1中 & 存在于set2中
  var intersection = set1.intersection(set2);
  print(intersection);
  // 并集 - 存在于set1中 || 存在于set2中
  var union = set1.union(set2);
  print(union);
  // 7.Runes
  Runes runes = Runes('');
  var s = String.fromCharCodes(runes);
  print(s);

  /// 5.闭包
  // 返回一个函数
  // 函数也是一个对象
  Function makeAdd(int a, int b) {
    return (int y) => a + y;
  }
  // 接收一个函数
  var addFunc = makeAdd(10, 12);
  // 打印结果
  print(addFunc(12));

  /// 7.操作符号
  // 30min
}


/// 4.函数
int add(int a, int b) {
  // 命名参数
  // 可以方法中写方法
  int share(int a, int b) => a + b;

  clind(a: 1, b: 2);

  kou(1, 5);

  // 如果不写return会默认加上return null
  return a + b;
}
// 如果表达式只有一行语句则可以使用 =>
int sum(int a, int b) => a + b;
// 可选命名参数{param1, param2,...}
int clind({int a, int b}) {
  return a + b;
}
// 可选位置参数
int kou(int a, [int b, int c]) {
  return a + b;
}
// 可选命名默认参数
int defaultClind({int a = 1, int b = 3}) {
  return a + b;
}
// 可选位置默认参数
int defaultKou(int a, [int b = 1, int c = 2]) {
  return a + b;
}
// 参数是List
void cloud({List list = const [1, 2, 3]}) {

}
/*
匿名函数/(name) => print('$name')
(name) - 参数
print('$name') - 代码块
*/
// 无参匿名函数
var printFunc = () => print('nb');
// 有参匿名函数
var printFunc1 = (name) => print('$name');
/*
匿名函数做为参数
list - 数组
String func(str) - 函数/可以做为参数
*/
void log(List list, String func(str)) {
  var list = [1, 2, 3];
  log(list, (str) => str * 2);
}

/// 6.函数别名
// 函数名保持一致
typedef MyFunc(int a, int b);
clip(int a, int b) {
  print('${a+b}');
}
divide(int a, int b) {
  print('${a/b}');
}
demo() {
  MyFunc func = clip(2, 7);
  func = divide(2, 1);
}