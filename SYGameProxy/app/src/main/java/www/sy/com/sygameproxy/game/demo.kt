package www.sy.com.sygameproxy.game // 可选包头/包的声明

fun main(args: Array<String>) {

    /*
    * Kotlin基础知识
    * */
    //1.基本数据类型
    // Double Float
    // Long Int Short Byte
    var a: Double   // 浮点数：64位
    var b: Float     // 浮点数：32位
    var c: Long
    var d: Int
    var e: Short
    var f: Byte
    var g: Boolean
    var h: Char
    var m: String

    //2.输入函数
    print("哈哈哈")

    //3.类型转换
    var sum = 34
    var floatSum = sum.toFloat()

    //4.数组
    val array = arrayOf(1,2,3)  // 第一种方式创建数组/函数
    val arrayM = Array(4, {i->(i * 2)}) // 工厂函数：i从0开始/元素个数是4



}


