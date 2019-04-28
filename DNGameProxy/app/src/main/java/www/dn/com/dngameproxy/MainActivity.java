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

        // page22

    }
}
