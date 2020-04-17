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
  print()


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
  List ls = List();
  ls.add('ab');
  ls.add('ab');
  ls.add('ab');
  ls.add('ab');
  ls.first();

  // 5>.字典/Map - 与java类似

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
  var s = String.fromCharCodes(runes);
  print(s);

  /// 4.函数
  




  /// 5.闭包














  







  StringBuffer sb = StringBuffer();
  // 两者是等价的
  sb.write('dg');
  sb.write('da');
  // 链式调用
  sb..write('dg')..write('da');

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
  
  /// 8.流程控制语句
  
  /// 9.异常处理
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