import 'package:flutter/material.dart';

// 我们想将已有的两个沿垂直方向滚动的 ListView 成一个 ListView ，这样在第一ListView 滑动到底部时能自动接上第二 ListView
class CustomScrollView01 extends StatelessWidget {
  const CustomScrollView01({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('两个ListView')),
      body: buildTwoListView(),
    );
  }

  Widget buildTwoListView() {
    final ListView listView = ListView.builder(
      itemCount: 20,
      itemBuilder: (_, int index) => ListTile(title: Text('$index')),
    );
    return Column(
      children: <Widget>[
        Expanded(child: listView),
        const Divider(color: Colors.grey),
        Expanded(child: listView),
      ],
    );
  }
}
