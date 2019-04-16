package www.sy.com.sygameproxy.game // 可选包头/包的声明

fun main(args: Array<String>) {
    println("hello world")

    sum(1,2)

    log()
}

fun sum(a: Int, b: Int) : Int {
    return  a + b
}

fun log(): Unit {
    println("这里可以")
}
