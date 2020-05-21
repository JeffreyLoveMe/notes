// https://www.yiibai.com/dart/dart_programming_data_types.html
/*
文件导入
1>.import 'xxx' - 全部导入
2>.import 'xxx' show yyy - 部分导入 - 只导入yyy
3>.import 'xxx' hide yyy - 部分导入 - 除yyy导入其他
4>.import 'xxx' deferred as yyy - 延迟导入yyy
 */
import 'dart:collection';
import 'package:xml/xml.dart' as xml;

// shift + command + F --> 全局搜索
class Demo {
  // 标识符 - 与其他语言一致
  // 以“字母/下划线”开头，只能包含“字母/下划线/数字/$”
  // 严格区分大小写
  String msg = 'msg是一个标识符';

  // 语句结束符 - dart语言以';'结束

  // 注释
  // 单行注释
  /*
  多行注释
   */

  // 输出语句
  void log() {
    print('hello world');
  }

  // 数据类型
  void numType() {
    // 一、数字类型 - 整数可以转换成双精度浮点数
    int a = 1; // int - 表示任意大小的整数
    double b = 2.00; // double - 表示小数
    num sum = 0.01;  // num - 表示int/double的父类
    // int s = 0.1;  // 不要把小数分配给整数（会抛出异常）
    print(sum);

    // 二、字符串 - 可以使用''/""
    // dart语言中字符串是不可变的
    String c = '这是一个字符串';
    String d = '这也是一个字符串';
    // 虽然字符串不可变但是可以操作字符串返回新的字符串
    String c1 = c.trim();  // 删除字符串前后的空格
    List list = c1.split(','); // 分割字符串返回List
    c.substring(1, 5);  // 分割字符串(包含1，包含5？？？)
    c1.toLowerCase();  // 将字符串全部小写
    c1.toUpperCase();  // 将字符串全部大写
    print(list);
    // 1>.字符串 -> 数字
    int e = int.parse(c);
    double f = double.parse(d);
    // 2>.数字 -> 字符串？？？
    String g = a.toString();
    String h = b.toString();
    String numString = sum.toString();
    // 3>.拼接字符串/万能拼接'${xxx}'
    String h1 = '${2+2}';   // ${表达式}
    String i = '${'wy'}';  // 万能拼接
    String j = '$h1$i$e$f$g$h$numString'; // 如果是拼接标识符可以省略'{}'
    String k = i + j;  // 如果是两个字符串拼接可以直接使用‘+’
    // 4>.创建多行语句
    String l = '''
    你好，
    China
    ''';
    print(l);

    // 三、布尔类型 - 没有非零既真/必须有明确的真假
    assert(k.isEmpty); // 检查是否是空字符串
    assert(e == 0); // 检查零值
    var hitTest;
    assert(hitTest == null); // 检查是否为null
    bool varName = true;
    if (varName) {
      varName = false;
    } else {
      print('走到这里');
    }

    // 四、数组List - 有序
    // var goodList = <String>[];  // 推荐使用
    // 1>.固定长度列表 - 默认已经指定长度/长度不能在运行时更改
    var listName = new List(3);
    listName[0] = 1;
    listName[1] = 2;
    listName[2] = 3;
    // 2>.可增长列表 - 默认没有指定长度/长度能在运行时更改
    // 创建一个空List
    var listM = new List();  
    listM.add(1);
    listM.first;
    // 创建一个有值List
    var firstList = [1, 2, 3]; 
    firstList.length; // List长度
    if (firstList.length > 1) {
      var _ = firstList[1]; // 获取List第2个元素
      firstList.add(1);     // 添加元素
      firstList.first;     // 返回第一个元素
      if (firstList.isEmpty) {
        print('firstList是空的');
      }
      firstList.removeLast(); // 删除最后一个元素
      firstList.removeAt(2);   // 删除第3个元素
      firstList.reversed;  // List逆序
      firstList.length;    // List长度
    }

    // 五、集合Set - 无序
    // 集合元素不能相同？？？
    var set = {'123', '1234', '1235'}; // 创建非空Set不需要指定类型
    var emptySet = <String>{};  // 创建空Set需要指定类型
    set.length; // 获取集合长度
    emptySet.add('12345'); // 添加元素
    set.addAll(emptySet);  // 将emptySet中的元素添加到set中（不是把emptySet添加到set中）


    // 六、映射 - Map对象
    // var goodMap = <String, Object>{};  // 推荐使用
    // dart语言中规定 - 映射中的键值对都可以是任何类型
    // 映射可以在运行时增长和缩小
    // 1>.第一种创建方式
    var gifts = {
      'key1':'value1',
      'key2':'value2',
      'key3':'value3'
    };
    // 获取映射中的value
    assert(gifts['key1'] == 'value1');
    // 获取映射中的value，如果获取不到直接返回null
    assert(gifts['key4'] == null);
    gifts.length;  // 返回映射中键值对的个数
    // 2>.第二种创建方式
    // 创建赋值 - 不推荐使用
    var giftMaps = Map();
    giftMaps['key1'] = 'value1';
    giftMaps['key2'] = 'value2';
    giftMaps['key3'] = 'value3';
    // 修改
    giftMaps['key1'] = 'value11'; // 修改Map
    giftMaps['key4'] = 'value4';  // 添加map
    giftMaps.keys;   // 返回所有的key
    giftMaps.values; // 返回所有的value
    giftMaps.length; // 返回map的长度
    giftMaps.clear(); // 删除map中所有的键值对
    // 3>.新建常量映射
    final map = const {
      1: 'value1',
      2: 'value2',
      3: 'value3'
    };
    print(map);

    // 七、符文 - UTF-32的代码点
    String.fromCharCode(1);

    // 八、符号Symbol - Symbol对象表示dart程序中声明的运算符或标识符
    // dart的符号是不透明的动态字符串的名称
    // 符号是一种存储人类可读字符串与优化供计算机使用的字符串之间关系的方法
    Symbol obj = new Symbol('f'); // f - 必须是有效的公共Dart成员名称，公共构造函数名称或库名称
    print(obj);
  }

  // 变量 - 使用变量之前必须先声明变量
  // 变量存储对值的引用/dart语言支持类型检查
  // 注意 - dart语言中一切皆对象/未初始化的变量默认为null/数字类型、布尔类型没有初始化都默认为null
  /*
   * 问题 - var/Object/dynamic都可以声明变量，它们的区别是什么？
   * var - 如果没有初始化值可以变成任何类型/如果有初始化值声明的变量类型固定不能改变
   * Object - 动态任意类型/声明的变量类型可以改变/编辑的时候会检查类型
   * dynamic - 动态任意类型/声明的变量类型可以改变/编译的时候不检查类型
   */
  void disVariable() {
    // 如果有初始化值声明的变量类型固定不能改变
    // 支持类型推导
    // 推荐使用
    var name = 'wy';

    // 动态任意类型/声明的变量类型可以改变/编译的时候会检查类型
    // 不推荐使用
    Object weight = '125';
    // weight = 123;   // 编译的时候会报错

    // 动态任意类型/声明的变量类型可以改变/编译的时候不检查类型
    // 类似oc种的id类型
    dynamic height = '180'; 
    // height = 170; // 编译不报错/运行报错 - 编译的时候不检查类型

    // 使用默认类型
    // 类似java
    String age = '18';

    print('$name 今年 $age 岁，体重 $weight 身高 $height');
  }

  // 常量 - 不可以修改/final、const关键字用于声明常量
  /*
  final - xxx？？？
  const - 表示编译时常量/值将在编译时确定
   */
  void disConstant() {
    /*
    v1 - 
    v2 - 
    v3 - 
    v4 -
     */
    final int v1 = 12;
    const int v2 = 13;
    final v3 = 12;
    const v4 = 13;
  }

  // 运算符
  void disOperator() {
    // 1>.基础运算符
    var m1 = 2;
    var m2 = 3;
    var result = (m1 & m2);
    result = (m1 | m2);
    result = (m1 ^ m2);
    result = (~m1);
    result = (m1 ~/ m2); // 取整 - 实际上就是商
    int sum = 2;
    String s = sum as String; // as表示’类型转换‘
    assert(sum is int);  // is代表‘是否是’
    // ? - 可选类型
    // ?? - 与swift一致
    String msg;
    print(msg?.length); 
    print('$result/$s');

    // 2>.条件语句
    if (m1 > m2) {
      
    } else {

    }
    switch (m1) {
      case 1: {

      }
        break;
      case 2: {

      }
        break;
      default: {

      }
    }
    // 3>.循环语句
    for (var i = 0; i < 1000; i++) {
      print('循环语句');
    }
    var list = [1, 2, 3, 4];
    for (var item in list) {
      print(item);
    }
    while (m1 < m2) {
      
    }
    do {
      
    } while (m1 < m2);
  }

  // 函数 - 可读/可维护/可重用代码的代码块
  // Function - 函数也是对象/函数也是对象/函数也是对象
  // 1>.普通函数
  void disNormal(int a, int b, int c) {
    int result = a + b + c;
    print(result);
  }
  // 2>.可选位置参数 - ？？？
  int disSum(int a, [int b, int c]) {
    return a + b + c;
  }
  // 3>.可选命名参数 - ？？？
  int disClick(int a, {int b, int c}) {
    return a + b + c;
  }
  // 4>.带有默认值的可选函数 - ？？？
  int disDefault(int a, [int b = 1, int c = 2]) {
    return a + b + c;
  }
  // 5>.递归函数
  // 6>.Lambda函数 - 函数块只有一条语句
  void single() => print('Lambda函数');

  // 枚举 - ？？？
  void loginType() {
    var type = enumName.codeLoginType;
    switch (type) {
      case enumName.normalLoginType: {
        print('普通登录');
      }
        break;
      case enumName.phoneLoginType: {
        print('手机登录');
      }
        break;
      case enumName.codeLoginType: {
        print('验证码登录');
      }
        break;
    }

    // 时间处理
    // 1>.获取当前时间
    DateTime.now();
    // 2>.创建一个指定时间年月日的DateTime对象
    DateTime(2009, 03, 03);
    // 3>.解析日期字符串
    DateTime.parse('2019-03-02');
    // 4.解析时间戳
    DateTime.fromMillisecondsSinceEpoch(15516161200000);
  }

  // dart集合
  void disQueue() {
    Queue queue = new Queue();
    queue.addAll([12, 13, 14]);
    // 遍历
    Iterator iterator = queue.iterator;
    while (iterator.moveNext()) {
      print(iterator.current);
    }
  }

  // 包 - 封装一组编程单元的一种机制
  // App可能需要集成某些第三方库或插件 - 每种语言都会提供一种机制来管理外部软件包
  /*
  dart的软件包管理器是pub
  1.pub get - 获取App所依赖的所有包
  2.pub upgrade - 将所有依赖项升级到较新版本
  3.pub build - 用于构建您的Web应用程序
  4.pub help - 将提供所有pub命名帮助
   */
  // 下载第三方库：先在pubspec.yaml中写上需要下载的第三方库 -> 然后选中pubspec.yaml -> 最后Get Packages
  void disXml() {
    var bookXml = '''
    <?xml version = "1.0"?> 
      <bookshelf> 
        <book> 
          <title lang = "english">Growing a Language</title> 
          <price>29.99</price> 
        </book> 

        <book> 
         <title lang = "english">Learning XML</title> 
         <price>39.95</price> 
        </book> 
      <price>132.00</price> 
    </bookshelf>
    ''';
    var documentXml = xml.parse(bookXml);
    print(documentXml.toString());
  }

  // 3.异常处理 - 在执行程序期间出现问题
  // 特点 - 发生异常时程序的正常流程中断，程序会异常中止
  void disException() {
    // 第一种写法
    try {
      // 可能会导致异常的代码
      testAge(-2);
    } catch (e) {
      // 如果发生异常在这里处理
      CustomException exception = e;
      exception.msgError();
    } finally {
      // 可选 - 总是会执行这里
    }
    // 第二种写法
    try {
      // 可能会导致异常的代码
      testAge(-2);
    } on Exception {
      // 如果发生异常在这里处理
    } finally {
      // 可选 - 总是会执行这里
    }
  }
  // 2.抛出异常
  void testAge(int age) {
    if (age < 0) {
      // throw new FormatException();
      throw new CustomException();
    }
  }
  // 自定义异常 -> 抛出异常 -> 异常处理

  // dart调试 - 查找和修复错误的过程称为调试
}

// 1.自定义异常
class CustomException implements Exception {
  String msgError() => 'Amount should be greater than zero';
}

// 枚举 - 特殊的类，通常用来表示相同类型的一组常量
// 枚举不能被继承，不能创建实例
enum enumName {
  normalLoginType,
  phoneLoginType,
  codeLoginType
}

// 类
// dart是一门面向对象的语言 - 支持面向对象编程
// 声明一个类/dart不支持多继承/支持多重继承
// 继承 - 子类可以继承父类除构造函数以外的所有属性和函数
// dart支持方法重写
class Test extends Demo {
  // 成员变量
  String name = 'wy';
  // 静态变量
  static int age = 12;
  // ‘_’表示私有
  String _method;
  void _disAdd() {
    _method = 'wy';
    print(_method);
  }
  // setter方法
  set testName(String name) {
    this.name = name;
  }
  // getter方法
  String get testName {
    return this.name;
  }
  // 构造函数
  // 1>.普通构造函数
  Test() {
    print('');
  }
  // 2>.命名构造函数
  Test.nameConst() {
    // this - 表示引用类的当前实例
    this.name = '';
  }
  // 使用这些方法
  void disDemo() {
    // 0>.super - 直接调用父类方法
    super.disConstant();
    // 1>.实例化Test
    Test test = new Test();
    test = Test();
    test = new Test.nameConst();
    // 2>.调用成员变量
    test.name = 'xwj';
    // 3>.调用对象函数
    test.disDemo();
    test._disAdd();
    // 4.调用静态函数
    Test.disTest();
  }
  // 静态函数 - 需要类名调用
  static void disTest() {
    // 状态 - 描述对象
    // 行为 - 描述对象可以执行的操作
    // 标识 - 将对象与一组类似对象区分开来的唯一值
  }
}

// 抽象类和接口
abstract class Massage {
  void doMassage();
}

class FootMassage implements Massage {
  @override
  void doMassage() {
    print('脚底按摩');
  }
}

class BackMassage implements Massage {
  @override
  void doMassage() {
    print('背部按摩');
  }
}


// // 2.常量声明 - 使用final和const
//   // 第一、final和const的共同点
//   // 1>.常量声明可以省略常量类型
//   final String m6 = 'ab';
//   // // 2>.常量初始化以后不能再次赋值
//   // m6 = '123'; // 报错
//   final m7 = 'ab';
//   const String m8 = 'ab';
//   const m9 = 'ab';
//   // // 2>.不能与var一起使用（跟swift一样：var代表变量）
//   // final var m10 = 'ab'; // 报错
//   // const var m10 = 'ab'; // 报错
//   // 第二、final和const的区别
//   // 1>.类级别常量使用static const
//   // 2>.const可以使用其他const常量的值来初始化其值
//   const width = 100;
//   const height = 100;
//   const square = width * height;
//   print(square);
//   // 3>.使用const赋值声明（const可以省略）
//   // 第二个const可以省略
//   var list1 = const [1, 2, 3];  // list1数组可以修改/list1[x]元素不能修改
//   const list2 = const [1, 2, 3]; // list1数组不能修改/list1[x]元素不能修改
//   final list3 = const [1, 2, 3]; // list1数组不能修改/list1[x]元素不能修改
//   // 4>.可以更改非final/非const变量的值（即使曾经具有const值）
//   // 5>.const导致的不可变性是可传递的（子类会继承）
//   // 6>.相同的const常量不会在内存中重复传递
//   // 7>.const需要是编译时常量
//   print(identical(list2, list3)); // 判断两个对象是否一致/返回true - 表示常量指向同一块内存


//  // 6>.集合Set
//   Set oneSet = Set();
//   oneSet.addAll([1, 2, 3, 4]);
//   Set twoSet = Set();
//   twoSet.addAll([1, 2, 5, 6]);
//   // 补集 - 存在于set1中 & 不存在于set2中
//   var difference = oneSet.difference(twoSet);
//   print(difference);
//   // 交集 - 存在于set1中 & 存在于set2中
//   var intersection = oneSet.intersection(twoSet);
//   print(intersection);
//   // 并集 - 存在于set1中 || 存在于set2中
//   var union = oneSet.union(twoSet);
//   print(union);


//  // 8>.匿名函数
//   // (name) - 参数
//   // print('$name') - 代码块
//   var mName = (name) => print('$name'); // 有参匿名函数
//   var sName = () => print(''); // 无参匿名函数
//   // 一个函数做为另一个函数参数
//   // String - 函数返回类型
//   // func - 函数名称/自定义 - 形参
//   // str - 函数入参
//   void sLogger(String func(str)) {

//   }
//   sLogger(mName);
//   void state(String func()) {

//   }
//   state(sName);
//   // 9>.函数别名 - ？？？
//   // 5.闭包 - 返回一个函数/函数也是一个对象
//   Function makeAdd(int a, int b) {
//     return (int y) => a + y;
//   }
//   // 接收一个函数
//   var addFunc = makeAdd(10, 12);
//   // 打印结果
//   print(addFunc(12));