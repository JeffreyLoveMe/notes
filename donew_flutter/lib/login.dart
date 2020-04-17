import 'package:flutter/material.dart';

void main() => runApp(
  MaterialApp(
    title: 'Simple Login',
    home: AppPage(),
  )

);

class AppPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    // GlobalKey<FormState> _loginKey = GlobalKey();

    // String _userName;
    // String _password;

    // void _login() {
    //   var loginForm = _loginKey.currentState;
    // }

    return Scaffold(
      appBar: AppBar(
        title: Text('Simple Login'),
      ),
      body: Container(
        margin: EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            children: <Widget>[
              TextFormField(
                decoration: InputDecoration(
                  labelText: '请输入登录用户名',
                  hintText: '请输入登录用户名'
                ),
              ),
              SizedBox(
                height: 30.0,
              ),
              TextFormField(
                decoration: InputDecoration(
                  labelText: '请输入用户密码',
                  hintText: '请输入登录用户名'
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 30.0),
                child: SizedBox(
                  width: 400.0,
                  height: 45.0,
                  child: RaisedButton(
                    onPressed: (){
                      // 按钮事件
                    },
                    child: Text(
                      '登录',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20.0
                      ),),),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

