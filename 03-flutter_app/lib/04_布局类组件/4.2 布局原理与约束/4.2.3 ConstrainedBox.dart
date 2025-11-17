import 'package:flutter/material.dart';

///
/// Flutter 中有两种布局模型：
/// 基于 RenderBox 的盒子模型布局。
/// 基于 Sliver ( RenderSliver ) 按需加载列表布局。
///
class ConstrainedBoxDemo extends StatefulWidget {
  const ConstrainedBoxDemo({super.key});

  @override
  State<ConstrainedBoxDemo> createState() => _ConstrainedBoxDemoState();
}

class _ConstrainedBoxDemoState extends State<ConstrainedBoxDemo> {
  Widget redBox = const DecoratedBox(decoration: BoxDecoration(color: Colors.red));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'ConstrainedBoxDemo',
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
        actions: const <Widget>[
          SizedBox(
            width: 20,
            height: 20,
            child: CircularProgressIndicator(
              strokeWidth: 3,
              valueColor: AlwaysStoppedAnimation<Color>(Colors.white70),
            ),
          ),
        ],
        backgroundColor: Colors.blue,
      ),
      body: Column(
        spacing: 20,
        children: <Widget>[
          ConstrainedBox(
            constraints: const BoxConstraints(
              minWidth: double.infinity, // 宽度尽可能大
              minHeight: 50.0, // 最小高度为50像素
            ),
            child: SizedBox(height: 5.0, child: redBox),
          ),

          SizedBox(width: 80.0, height: 80.0, child: redBox),

          // 等价于
          ConstrainedBox(
            constraints: const BoxConstraints.tightFor(width: 80.0, height: 80.0),
            child: redBox,
          ),

          // 多重限制
          ConstrainedBox(
            constraints: const BoxConstraints(minWidth: 60.0, minHeight: 60.0), //父
            child: ConstrainedBox(
              constraints: const BoxConstraints(minWidth: 90.0, minHeight: 20.0), //子
              child: redBox,
            ),
          ),

          // UnconstrainedBox
          ConstrainedBox(
            constraints: const BoxConstraints(minWidth: 60.0, minHeight: 100.0), //父
            child: UnconstrainedBox(
              // “去除”父级限制
              child: ConstrainedBox(
                constraints: const BoxConstraints(minWidth: 90.0, minHeight: 20.0), //子
                child: redBox,
              ),
            ),
          ),

          // 溢出父类布局
          Container(
            width: 200,
            height: 200,
            color: Colors.blue,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Row(children: <Widget>[Flexible(child: Text('xx' * 30))]),
            ),
          ),
        ],
      ),
    );
  }
}
