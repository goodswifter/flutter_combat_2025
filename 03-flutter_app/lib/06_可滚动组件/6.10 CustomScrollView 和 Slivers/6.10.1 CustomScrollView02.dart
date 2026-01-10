import 'package:flutter/material.dart';

// 我们想将已有的两个沿垂直方向滚动的 ListView 成一个 ListView ，这样在第一ListView 滑动到底部时能自动接上第二 ListView
class CustomScrollView02 extends StatelessWidget {
  const CustomScrollView02({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('合并两个ListView')),
      body: buildTwoListView(),
    );
  }

  Widget buildTwoListView() {
    // SliverFixedExtentList 是一个 Sliver，它可以生成高度相同的列表项。
    // 再次提醒，如果列表项高度相同，我们应该优先使用SliverFixedExtentList
    // 和 SliverPrototypeExtentList，如果不同，使用 SliverList.
    final SliverFixedExtentList listView = SliverFixedExtentList(
      itemExtent: 56, //列表项高度固定
      delegate: SliverChildBuilderDelegate(
        (_, int index) => ListTile(title: Text('$index')),
        childCount: 10,
      ),
    );
    return CustomScrollView(slivers: <Widget>[listView, listView]);
  }
}
