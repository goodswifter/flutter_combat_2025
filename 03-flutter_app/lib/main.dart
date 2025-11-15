import 'package:flutter/material.dart';

import '03_基础组件/3.6 进度指示器/3.6.3 进度色动画.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Flutter Demo',
      // 第3章 基础组件
      // 3.1 文本及样式
      // home: TextDemo(),
      // 3.2 按钮
      // home: ButtonDemo(),
      // 3.3 图片及ICON
      // home: ImageDemo(),
      // 3.4 单选开关和复选框
      // home: CheckBoxDemo(),
      // 3.5.1 TextField
      // home: TextFieldDemo(),
      // 3.5.1 TextField-02控制焦点
      // home: TextFieldDemo2(),
      // 3.5.2 表单Form
      // home: FormDemo(),
      // 3.6 进度指示器
      home: ProgressColorDemo(),
    );
  }
}
