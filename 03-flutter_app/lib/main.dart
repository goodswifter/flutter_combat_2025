import 'package:flutter/material.dart';

import '06_可滚动组件/6.12 嵌套可滚动组件 NestedScrollView/6.12.4 嵌套 TabBarView.dart';

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
      // 6.2.2 实例
      // home: SingleChildScrollViewTestRoute(),

      // 6.3.6 实例：无限加载列表
      // home: InfiniteLoadingListPage(),

      // 6.4 ScrollController
      // 6.4.1 ScrollController滚动监听
      // home: ScrollControllerTestRoute(),
      // 6.4.2 滚动通知
      // home: ScrollNotificationTestRoute(),

      // 6.5 AnimatedList
      // home: AnimatedListRoute(),

      // 6.6 GridView
      // home: InfiniteGridView(),

      // 6.7 PageView与页面缓存
      // home: PageViewWithCacheRoute(),

      // 6.8 可滚动组件子项缓存
      // home: KeepAliveTest(),

      // 6.9 TabBarView
      // 6.9.1 TabBarView基本
      // home: TabViewRoute1(),
      // 6.9.2 TabBarView优化
      // home: TabViewRoute2(),

      // 6.10 CustomScrollView 和 Slivers
      // 6.10.1 CustomScrollView01
      // home: CustomScrollView01(),
      // 6.10.1 CustomScrollView02
      // home: CustomScrollView02(),
      // 6.10.2 各种 Sliver
      // home: VariousSlivers(),
      // 6.10.2 PersistentHeaderRoute
      // home: PersistentHeaderRoute(),

      // 6.11 自定义 Sliver
      // home: SliverFlexibleHeaderRoute(),
      // home: SliverPersistentHeaderToBoxRoute(),

      // 6.12 嵌套可滚动组件
      // 6.12.1 NestedScrollView
      // home: NestedScrollViewRoute(),
      // 6.12.3 SliverAppBar
      // home: SnapAppBar(),
      // 6.12.3 SliverAppBar2
      // home: SnapAppBar2(),
      // 6.12.4 嵌套 TabBarView
      home: NestedTabBarView1(),
    );
  }
}
