import 'package:flutter/material.dart';

class BottomTabNavigationDemo extends StatefulWidget {
  const BottomTabNavigationDemo({super.key});

  @override
  State<BottomTabNavigationDemo> createState() => _BottomTabNavigationDemoState();
}

class _BottomTabNavigationDemoState extends State<BottomTabNavigationDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //导航栏
        title: const Text('App Name'),
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(Icons.dashboard), //自定义图标
              onPressed: () {
                // 打开抽屉菜单
                Scaffold.of(context).openDrawer();
              },
            );
          },
        ),
        actions: <Widget>[
          //导航栏右侧菜单
          IconButton(icon: const Icon(Icons.share), onPressed: () {}),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.white,
        shape: const CircularNotchedRectangle(), // 底部导航栏打一个圆形的洞
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            IconButton(icon: const Icon(Icons.home), onPressed: () {}),
            const SizedBox(), //中间位置空出
            IconButton(icon: const Icon(Icons.business), onPressed: () {}),
          ], //均分底部导航栏横向空间
        ),
      ),
      floatingActionButton: FloatingActionButton(
        // 悬浮按钮
        onPressed: _onAdd, // 悬浮按钮
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: .centerDocked,
    );
  }

  void _onAdd() {}
}
