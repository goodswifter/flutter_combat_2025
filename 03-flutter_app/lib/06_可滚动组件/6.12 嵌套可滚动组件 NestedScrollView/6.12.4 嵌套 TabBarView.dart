import 'package:flutter/material.dart';
import 'package:flutter_template/utils/build_util.dart';

class NestedTabBarView1 extends StatelessWidget {
  const NestedTabBarView1({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> tabs = <String>['猜你喜欢', '今日特价', '发现更多'];
    // 构建 tabBar
    return DefaultTabController(
      length: tabs.length, // tab的数量.
      child: Scaffold(
        body: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverOverlapAbsorber(
                handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
                sliver: SliverAppBar(
                  title: const Text('商城'),
                  floating: true,
                  snap: true,
                  forceElevated: innerBoxIsScrolled,
                  bottom: TabBar(tabs: tabs.map((String name) => Tab(text: name)).toList()),
                ),
              ),
            ];
          },
          body: TabBarView(
            children: tabs.map((String name) {
              return Builder(
                builder: (BuildContext context) {
                  return CustomScrollView(
                    key: PageStorageKey<String>(name),
                    slivers: <Widget>[
                      SliverOverlapInjector(
                        handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
                      ),
                      SliverPadding(padding: const .all(8.0), sliver: buildSliverList(50)),
                    ],
                  );
                },
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}
