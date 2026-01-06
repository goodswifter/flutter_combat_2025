import 'package:flutter/material.dart';

import '05_容器类组件/5.7 页面骨架（Scaffold）/5.7.5 底部Tab导航栏.dart';

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
      // 5.7.1
      // home: ScaffoldDemo(),
      // 5.7.5
      home: BottomTabNavigationDemo(),
    );
  }
}
