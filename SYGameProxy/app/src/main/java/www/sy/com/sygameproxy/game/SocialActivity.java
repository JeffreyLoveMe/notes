package www.sy.com.sygameproxy.game;

import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;

import www.sy.com.sygameproxy.R;

public class SocialActivity extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_social);

        // 初始化操作

        // task是用来管理屏幕的
        // activity位于屏幕前台-就是位于task的顶部/激活状态
        // 失去焦点，但是仍然可以对用户可见/暂停状态
        // 完全被另一个Activity覆盖/停止状态
    }

    @Override
    protected void onStart() {
        super.onStart();
    }

    @Override
    protected void onRestart() {
        super.onRestart();
        //可视生命周期
    }

    @Override
    protected void onResume() {
        super.onResume();
    }

    @Override
    protected void onPause() {
        super.onPause();
    }

    @Override
    protected void onStop() {
        super.onStop();
    }

    @Override
    protected void onDestroy() {
        super.onDestroy();
        // 销毁线程
    }
}
