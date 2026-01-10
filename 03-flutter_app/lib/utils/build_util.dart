import 'package:flutter/material.dart';

/// 构建一个包含指定数量列表项的 SliverList
///
/// [count] 列表项的数量
SliverList buildSliverList(int count) {
  return SliverList(
    delegate: SliverChildBuilderDelegate((BuildContext context, int index) {
      return ListTile(
        title: Text('Item $index'),
        leading: CircleAvatar(child: Text('${index + 1}')),
      );
    }, childCount: count),
  );
}
