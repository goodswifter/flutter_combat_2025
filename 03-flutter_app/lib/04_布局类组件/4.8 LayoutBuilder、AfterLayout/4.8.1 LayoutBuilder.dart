import 'package:flutter/material.dart';

/// LayoutBuilder(布局构建器) 组件用于根据父组件的约束来构建子组件。
/// 1. 响应式布局
///   比如根据屏幕宽度来决定显示单列还是双列
class LayoutBuilderDemo extends StatelessWidget {
  const LayoutBuilderDemo({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Text> texts = List<Text>.filled(6, const Text('A'));

    return Scaffold(
      appBar: AppBar(title: const Text('')),
      body: Center(
        child: Column(
          children: <Widget>[
            // 限制宽度为190，小于 200
            SizedBox(width: 190, child: ResponsiveColumn(children: texts)),
            ResponsiveColumn(children: texts),
            const LayoutLogPrint<String>(tag: 'xxx', child: Text('xx')), // 下面介绍
          ],
        ),
      ),
    );
  }
}

class ResponsiveColumn extends StatelessWidget {
  const ResponsiveColumn({super.key, required this.children});

  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    // 通过 LayoutBuilder 拿到父组件传递的约束，然后判断 maxWidth 是否小于200
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        if (constraints.maxWidth < 200) {
          // 最大宽度小于200，显示单列
          return Column(mainAxisSize: MainAxisSize.min, children: children);
        } else {
          // 大于200，显示双列
          final List<Widget> items = <Widget>[];
          for (int i = 0; i < children.length; i += 2) {
            if (i + 1 < children.length) {
              items.add(
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[children[i], children[i + 1]],
                ),
              );
            } else {
              items.add(children[i]);
            }
          }
          return Column(mainAxisSize: MainAxisSize.min, children: items);
        }
      },
    );
  }
}

class LayoutLogPrint<T extends Object> extends StatelessWidget {
  const LayoutLogPrint({super.key, this.tag, required this.child});

  final Widget child;
  final T? tag; // 指定日志tag

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (_, BoxConstraints constraints) {
        // assert在编译release版本时会被去除
        assert(() {
          print('${tag ?? key ?? child}: $constraints');
          return true;
        }());
        return child;
      },
    );
  }
}
