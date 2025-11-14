import 'package:flutter/material.dart';

import '03_基础组件/3.5 输入框及表单/3.5.2 表单Form.dart';

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
      // 2.2.6_state_life_cycle
      // home: const MyHomePage(),
      // 2.2.7_在子widget 树中获取父类State对象
      // home: const GetStateObjectRoute(),
      // 2.2.9_Cupertino组件
      // home: CupertinoTestRoute(),
      // 2.3.2_Widget管理自身状态
      // home: TapboxA(),
      // 2.3.3_父Widget管理子Widget的状态
      // home: ParentWidgetB(),
      // 2.3.4 混合状态管理
      // home: ParentWidgetC(),
      // 2.4.1 路由管理
      // home: HomePage(),
      // 2.4.4 路由传值
      // home: RouterTestRoute(),
      // 2.4.5 命名路由
      // 注册路由表
      // routes: <String, WidgetBuilder>{
      //   '/': (BuildContext context) => const NamedRouteHomePage(), // 根路由
      //   'new_page': (BuildContext context) => const NameRouteNewRoute(),
      //   // ... // 省略其他路由注册信息
      // },
      // initialRoute: '/', // 指定初始路由

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
      home: FormDemo(),
    );
  }
}
