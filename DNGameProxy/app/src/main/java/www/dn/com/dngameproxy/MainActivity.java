package www.dn.com.dngameproxy; // 包名

// 引用的包名/类名
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;

// 类定义：
// 只有一个主类public class xxx
// xxx与源文件名称必须一致
// 如果没有public，文件名可以不与类名一致
public class MainActivity extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

    }

    public void javaFunction() {
        // java具有面向对象、跨平台、安全、多线程
        // java版本-javaSE/javaEE/javaME
        // jvm -java虚拟机
        // 半编译、半解释型语言
        /*
        * java平台：
        * java虚拟机 -用程序仿真的假想计算机/依靠不同平台的JVM实现"一次编译，处处运行"
        * java API -java应用程序编程接口
        * */
        // xx.java -java源文件 --java编译器--> xx.class -字节码文件
        System.out.println("hello world");

        /*
        * 标识符：类名/变量名/方法名/类型名
        * 以字母/下划线/$开头
        * 不能把关键字/保留字作为标识符
        * java使用Unicode编码：所以支持使用汉字作为标识符
        * */

        /*
        * 关键字：boolean import...
        * 注释：//
        * java是强类型语言，java只有两种数据类型：引用数据类型/基本数据类型
        * */

        /*
        * 基本数据类型：byte8 short16 int32 long64 float32
        * double64 char16 boolean8
        * 常量（始终不变的量）""也是字符串常量/变量：基本存储单元、先声明在使用
        * 类变量系统自动init/局部变量必须init
        * */

        /*
        * 表达式：算术运算符、p29
        * */
    }
}
