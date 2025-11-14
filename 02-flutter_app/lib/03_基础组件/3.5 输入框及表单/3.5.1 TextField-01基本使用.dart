import 'package:flutter/material.dart';

class TextFieldDemo extends StatefulWidget {
  const TextFieldDemo({super.key});

  @override
  State<TextFieldDemo> createState() => _TextFieldDemoState();
}

class _TextFieldDemoState extends State<TextFieldDemo> {
  // 定义一个controller
  final TextEditingController _unameController = TextEditingController();

  // 定义一个选择控制器
  final TextEditingController _selectionController = TextEditingController();

  // 定义焦点控制器
  final FocusNode _selectionFocusNode = FocusNode();

  // 通过controller监听
  @override
  void initState() {
    super.initState();

    _unameController.addListener(() {
      print('value: ${_unameController.text}');
    });

    _selectionController.text = 'hello world!';

    // 在第一帧渲染完成后设置选择
    WidgetsBinding.instance.addPostFrameCallback((_) {
      // 先让 TextField 获取焦点
      _selectionFocusNode.requestFocus();
      // 然后设置选择范围
      _selectionController.selection = TextSelection(
        baseOffset: 2,
        extentOffset: _selectionController.text.length,
      );
    });
  }

  @override
  void dispose() {
    _unameController.dispose();
    _selectionController.dispose();
    _selectionFocusNode.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('TextFieldDemo')),
      body: GestureDetector(
        // 点击空白区域取消焦点
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        // 让GestureDetector能响应空白区域的点击
        behavior: HitTestBehavior.opaque,
        child: Container(
          width: double.infinity,
          height: double.infinity,
          padding: const EdgeInsets.all(16.0),
          child: Column(
            spacing: 20.0,
            children: <Widget>[
              TextField(
                controller: _unameController,
                autofocus: true,
                decoration: const InputDecoration(
                  labelText: '用户名',
                  hintText: '用户名或邮箱',
                  prefixIcon: Icon(Icons.person),
                ),
                onChanged: (String value) {
                  print('value: $value');
                },
              ),
              const TextField(
                decoration: InputDecoration(
                  labelText: '密码',
                  hintText: '您的登录密码',
                  prefixIcon: Icon(Icons.lock),
                ),
                obscureText: true,
              ),
              TextField(
                controller: _selectionController,
                focusNode: _selectionFocusNode,
                decoration: const InputDecoration(
                  hintText: '选择',
                  prefixIcon: Icon(Icons.select_all),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
