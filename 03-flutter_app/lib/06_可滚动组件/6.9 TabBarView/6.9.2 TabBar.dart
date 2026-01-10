import 'package:flutter/material.dart';

import '../../widgets/keep_alive_wrapper.dart';

class TabViewRoute1 extends StatefulWidget {
  const TabViewRoute1({super.key});

  @override
  State<TabViewRoute1> createState() => _TabViewRoute1State();
}

class _TabViewRoute1State extends State<TabViewRoute1> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final List<String> tabs = <String>['新闻', '历史', '图片'];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: tabs.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TabBar基本'),
        bottom: TabBar(
          controller: _tabController,
          tabs: tabs.map((String e) => Tab(text: e)).toList(),
        ),
      ),
      body: TabBarView(
        //构建
        controller: _tabController,
        children: tabs.map((String e) {
          return KeepAliveWrapper(
            child: Container(
              alignment: Alignment.center,
              child: Text(e, textScaler: const TextScaler.linear(5)),
            ),
          );
        }).toList(),
      ),
    );
  }

  @override
  void dispose() {
    // 释放资源
    _tabController.dispose();
    super.dispose();
  }
}
