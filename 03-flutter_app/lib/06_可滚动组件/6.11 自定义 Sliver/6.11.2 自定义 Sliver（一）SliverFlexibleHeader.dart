import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_template/const/r.dart';

class SliverFlexibleHeaderRoute extends StatelessWidget {
  const SliverFlexibleHeaderRoute({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('SliverFlexibleHeader')),
      body: CustomScrollView(
        //为了能使CustomScrollView拉到顶部时还能继续往下拉，必须让 physics 支持弹性效果
        physics: const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
        slivers: <Widget>[
          //我们需要实现的 SliverFlexibleHeader 组件
          SliverFlexibleHeader(
            visibleExtent: 200, // 初始状态在列表中占用的布局高度
            // 为了能根据下拉状态变化来定制显示的布局，我们通过一个 builder 来动态构建布局。
            builder: (BuildContext context, double availableHeight, ScrollDirection direction) {
              return GestureDetector(
                onTap: () => print('tap'), //测试是否可以响应事件
                child: Image.asset(
                  R.ASSETS_APP_LOGO_WEBP,
                  width: 50.0,
                  height: availableHeight,
                  alignment: Alignment.bottomCenter,
                  fit: BoxFit.cover,
                ),
              );
            },
          ),
          // 构建一个list
          buildSliverList(30),
        ],
      ),
    );
  }

  // 构建固定高度的SliverList，count为列表项数量
  Widget buildSliverList([int count = 5]) {
    return SliverFixedExtentList(
      itemExtent: 50,
      delegate: SliverChildBuilderDelegate((BuildContext context, int index) {
        return ListTile(title: Text('Item $index'));
      }, childCount: count),
    );
  }
}

// 自定义的 SliverFlexibleHeader 组件
class SliverFlexibleHeader extends StatelessWidget {
  const SliverFlexibleHeader({super.key, required this.visibleExtent, required this.builder});

  final double visibleExtent;
  final Widget Function(BuildContext context, double availableHeight, ScrollDirection direction)
  builder;

  @override
  Widget build(BuildContext context) {
    return _SliverFlexibleHeader(
      visibleExtent: visibleExtent,
      child: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          return builder(
            context,
            constraints.maxHeight,
            ScrollDirection.idle, // 简化版本，实际需要监听滚动方向
          );
        },
      ),
    );
  }
}

class _SliverFlexibleHeader extends SingleChildRenderObjectWidget {
  const _SliverFlexibleHeader({required Widget super.child, this.visibleExtent = 0});
  final double visibleExtent;

  @override
  RenderObject createRenderObject(BuildContext context) {
    return _FlexibleHeaderRenderSliver(visibleExtent);
  }

  @override
  void updateRenderObject(BuildContext context, _FlexibleHeaderRenderSliver renderObject) {
    renderObject.visibleExtent = visibleExtent;
  }
}

class _FlexibleHeaderRenderSliver extends RenderSliverSingleBoxAdapter {
  _FlexibleHeaderRenderSliver(double visibleExtent) : _visibleExtent = visibleExtent;

  late double _visibleExtent = 0;

  set visibleExtent(double value) {
    // 可视长度发生变化，更新状态并重新布局
    if (_visibleExtent != value) {
      _visibleExtent = value;
      markNeedsLayout();
    }
  }

  @override
  void performLayout() {
    // 滑动距离大于_visibleExtent时则表示子节点已经在屏幕之外了
    if (child == null || (constraints.scrollOffset > _visibleExtent)) {
      geometry = SliverGeometry(scrollExtent: _visibleExtent);
      return;
    }

    // 测试overlap,下拉过程中overlap会一直变化.
    final double overScroll = constraints.overlap < 0 ? constraints.overlap.abs() : 0;

    // 在Viewport中顶部的可视空间为该 Sliver 可绘制的最大区域。
    // 1. 如果Sliver已经滑出可视区域则 constraints.scrollOffset 会大于 _visibleExtent，
    //    这种情况我们在一开始就判断过了。
    // 2. 如果我们下拉超出了边界，此时 overScroll>0，scrollOffset 值为0，所以最终的绘制区域为
    //    _visibleExtent + overScroll.
    double paintExtent = _visibleExtent + overScroll - constraints.scrollOffset;
    // 绘制高度不超过最大可绘制空间
    paintExtent = min(paintExtent, constraints.remainingPaintExtent);

    //对子组件进行布局，关于 layout 详细过程我们将在本书后面布局原理相关章节详细介绍，现在只需知道
    //子组件通过 LayoutBuilder可以拿到这里我们传递的约束对象（ExtraInfoBoxConstraints）
    child!.layout(constraints.asBoxConstraints(maxExtent: paintExtent), parentUsesSize: false);

    //最大为_visibleExtent，最小为 0
    final double layoutExtent = min(_visibleExtent, paintExtent);

    //设置geometry，Viewport 在布局时会用到
    geometry = SliverGeometry(
      scrollExtent: layoutExtent,
      paintOrigin: -overScroll,
      paintExtent: paintExtent,
      maxPaintExtent: paintExtent,
      layoutExtent: layoutExtent,
    );
  }
}
