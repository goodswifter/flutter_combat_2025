import 'package:flutter/material.dart';

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
    );
  }
}
