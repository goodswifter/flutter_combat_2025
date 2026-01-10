import 'package:flutter/material.dart';

class PageViewWithCacheRoute extends StatelessWidget {
  const PageViewWithCacheRoute({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Widget> children = <Widget>[];
    for (int i = 0; i < 6; i++) {
      children.add(Page(text: '$i'));
    }
    return Scaffold(
      appBar: AppBar(title: const Text('PageView与页面缓存')),
      body: PageView(
        // scrollDirection: .vertical,
        // 允许隐式滚动, 开启预渲染
        // 设置 allowImplicitScrolling 置为 true 时就只会缓存前后各一页，所以滑到第三页时，第一页就会销毁。
        allowImplicitScrolling: true,
        children: children,
      ),
    );
  }
}

// Tab 页面
class Page extends StatefulWidget {
  const Page({super.key, required this.text});

  final String text;

  @override
  State<Page> createState() => _PageState();
}

class _PageState extends State<Page> {
  @override
  Widget build(BuildContext context) {
    print('build ${widget.text}');
    return Center(child: Text(widget.text, textScaler: const TextScaler.linear(5)));
  }
}
