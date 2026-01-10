import 'package:flutter/material.dart';

import '../../widgets/keep_alive_wrapper.dart';

class TabViewRoute2 extends StatelessWidget {
  const TabViewRoute2({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> tabs = <String>['新闻', '历史', '图片'];
    return DefaultTabController(
      length: tabs.length,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('TabBar优化'),
          bottom: TabBar(tabs: tabs.map((String e) => Tab(text: e)).toList()),
        ),
        body: TabBarView(
          //构建
          children: tabs.map((String e) {
            return KeepAliveWrapper(
              child: Container(
                alignment: Alignment.center,
                child: Text(e, textScaler: const TextScaler.linear(5)),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
