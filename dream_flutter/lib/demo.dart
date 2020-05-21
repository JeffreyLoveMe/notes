// https://www.yiibai.com/dart/dart_programming_data_types.html
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
    // 1>.固定长度列表 - 长度不能在运行时更改
    var listName = new List(3);
    listName[0] = 1;
    listName[1] = 2;
    listName[2] = 3;
    // 2>.可增长列表 - 长度能在运行时更改
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
    // 创建赋值
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
  /*
  String - 
  var - 
  dynamic - 
   */
  void disVariable() {
    // 变量存储对值的引用/dart语言支持类型检查
    // 注意 - dart语言中一切皆对象/未初始化的变量默认为null/数字类型、布尔类型没有初始化都默认为null
    String age = '18';
    var name = 'wy';
    dynamic height = '180';
    print('$name 今年 $age 岁，身高 $height');
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
    print('$result');
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
  }
}

// 枚举
enum enumName {
  normalLoginType,
  phoneLoginType,
  codeLoginType
}

// 类 - xxx