import 'package:flutter/material.dart';

import '04_布局类组件/4.8 LayoutBuilder、AfterLayout/4.8.2 AfterLayout02.dart';

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
      // 4.2.3 ConstrainedBox
      // home: ConstrainedBoxDemo(),
      // 4.3.2 Row
      // home: RowDemo(),
      // 4.3.3 Column
      // home: ColumnDemo(),
      // 4.3.4 特殊情况
      // home: SpecialCaseDemo(),
      // 4.4.2 Expanded
      // home: ExpandedDemo(),
      // 4.5.1 Wrap
      // home: WrapDemo(),
      // 4.5.2 Flow
      // home: FlowDemo(),
      // 4.6.3 Stack(层叠布局)、Positioned(绝对定位)
      // home: StackPositionedDemo(),
      // 4.6.3 示例2
      // home: StackPositionedDemo2(),
      // 4.7.1 Align
      // home: AlignDemo(),
      // 4.7.3 Center组件
      // home: CenterDemo(),
      // 4.8.1 LayoutBuilder
      // home: LayoutBuilderDemo(),
      // 4.8.2 AfterLayout
      // home: AfterLayoutDemo(),
      home: AfterLayoutDemo2(),
    );
  }
}
