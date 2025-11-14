// ignore_for_file: file_names

import 'package:flutter/material.dart';

class GetStateObjectRoute extends StatefulWidget {
  const GetStateObjectRoute({super.key});

  @override
  State<GetStateObjectRoute> createState() => _GetStateObjectRouteState();
}

class _GetStateObjectRouteState extends State<GetStateObjectRoute> {
  // 定义一个globalKey, 由于GlobalKey要保持全局唯一性，我们使用静态变量存储
  // 注意：使用 GlobalKey 开销较大，如果有其他可选方案，应尽量避免使用它。另外，同一个 GlobalKey 在整个 widget 树中必须是唯一的，不能重复。
  static final GlobalKey<ScaffoldState> _globalKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _globalKey,
      appBar: AppBar(title: const Text('在子widget树中获取State对象')),
      body: Center(
        child: Column(
          spacing: 20,
          children: <Widget>[
            // 方式一：直接获取父类State对象
            // builder, 提供一个BuildContext对象，用于在子widget中获取父类State对象
            Builder(
              builder: (BuildContext context) {
                return ElevatedButton(
                  onPressed: () {
                    // 方式一：直接获取父类State对象
                    // 查找父级最近的Scaffold对应的ScaffoldState对象
                    final ScaffoldState state = context.findAncestorStateOfType<ScaffoldState>()!;
                    // 打开抽屉菜单
                    state.openDrawer();
                  },
                  child: const Text('打开抽屉菜单1'),
                );
              },
            ),

            // 方式二：直接通过of静态方法来获取ScaffoldState
            // 如果不使用Builder, 则需要将ScaffoldState对象传递给子widget
            // 报错: Scaffold.of() called with a context that does not contain a Scaffold.
            Builder(
              builder: (BuildContext context) {
                return ElevatedButton(
                  onPressed: () {
                    final ScaffoldState state = Scaffold.of(context);
                    state.openDrawer();
                  },
                  child: const Text('打开抽屉菜单2'),
                );
              },
            ),

            // 显示SnackBar
            Builder(
              builder: (BuildContext context) {
                return ElevatedButton(
                  onPressed: () {
                    ScaffoldMessenger.of(
                      context,
                    ).showSnackBar(const SnackBar(content: Text('我是SnackBar')));
                  },
                  child: const Text('显示SnackBar'),
                );
              },
            ),

            // 4. 通过globalKey获取ScaffoldState对象
            ElevatedButton(
              onPressed: () {
                _globalKey.currentState?.openDrawer();
              },
              child: const Text('通过globalKey打开抽屉菜单3'),
            ),
          ],
        ),
      ),
      drawer: const Drawer(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[Text('Drawer')],
        ),
      ),
    );
  }
}
