import 'package:flutter/material.dart';

class FormDemo extends StatefulWidget {
  const FormDemo({super.key});

  @override
  State<FormDemo> createState() => _FormDemoState();
}

class _FormDemoState extends State<FormDemo> {
  final TextEditingController _unameController = TextEditingController();
  final TextEditingController _pwdController = TextEditingController();
  final GlobalKey _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('FormDemo')),
      body: Form(
        key: _formKey, // 设置globalKey，用于后面获取FormState
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: Container(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: <Widget>[
              TextFormField(
                autofocus: true,
                controller: _unameController,
                decoration: const InputDecoration(
                  labelText: '用户名',
                  hintText: '用户名或邮箱',
                  icon: Icon(Icons.person),
                ),
                // 校验用户名
                validator: (String? v) {
                  return v!.trim().isNotEmpty ? null : '用户名不能为空';
                },
              ),
              TextFormField(
                controller: _pwdController,
                decoration: const InputDecoration(
                  labelText: '密码',
                  hintText: '您的登录密码',
                  icon: Icon(Icons.lock),
                ),
                obscureText: true,
                // 校验密码
                validator: (String? v) {
                  return v!.trim().length > 5 ? null : '密码不能少于6位';
                },
              ),
              // 登录按钮
              Padding(
                padding: const EdgeInsets.only(top: 28.0),
                child: Column(
                  spacing: 10.0,
                  children: <Widget>[
                    // 方式一：_formKey.currentState获取FormState
                    ElevatedButton(
                      child: const Padding(padding: EdgeInsets.all(16.0), child: Text('登录(方式一)')),
                      onPressed: () {
                        // 通过_formKey.currentState 获取FormState后，
                        // 调用validate()方法校验用户名密码是否合法，校验
                        // 通过后再提交数据。
                        if ((_formKey.currentState as FormState).validate()) {
                          // 验证通过提交数据
                          print('登录成功');
                        }
                      },
                    ),

                    // 方式二:
                    Builder(
                      builder: (BuildContext context) {
                        return ElevatedButton(
                          child: const Padding(
                            padding: EdgeInsets.all(16.0),
                            child: Text('登录(方式二)'),
                          ),
                          onPressed: () {
                            // 由于本widget也是Form的子代widget，所以可以通过下面方式获取FormState
                            if (Form.of(context).validate()) {
                              // 验证通过提交数据
                              print('登录成功2');
                            }
                          },
                        );
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
