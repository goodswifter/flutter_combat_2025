import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

/// AfterLayout(延迟布局构建器) 组件用于在组件布局完成后执行一些操作。
/// 1. 获取组件大小和相对于屏幕的坐标
/// 2. 获取组件相对于某个父组件的坐标
///
/// 注意：Flutter 官方没有内置 AfterLayout 组件，这是一个自定义实现
/// 现代 Flutter 开发中，推荐使用以下替代方案：
/// 1. WidgetsBinding.instance.addPostFrameCallback() - 在帧渲染后执行
/// 2. GlobalKey 获取组件的 RenderBox
/// 3. LayoutBuilder 配合 addPostFrameCallback

class AfterLayoutDemo extends StatelessWidget {
  const AfterLayoutDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('AfterLayout 示例')),
      body: Center(
        child: Column(
          mainAxisAlignment: .center,
          children: <Widget>[
            AfterLayout(
              callback: (RenderAfterLayout ral) {
                print('子组件的大小: ${ral.size}');
                print('子组件在屏幕中的坐标: ${ral.offset}');
              },
              child: Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.blue.shade100,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Text(
                  'flutter@wendux',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            const SizedBox(height: 20),
            const Text('查看控制台输出组件的尺寸和位置信息', style: TextStyle(color: Colors.grey)),
          ],
        ),
      ),
    );
  }
}

// ============ 自定义 AfterLayout 组件实现 ============

/// AfterLayout 组件 - 在布局完成后执行回调
class AfterLayout extends SingleChildRenderObjectWidget {
  const AfterLayout({super.key, required this.callback, super.child});

  /// 布局完成后的回调函数
  final ValueChanged<RenderAfterLayout> callback;

  @override
  RenderAfterLayout createRenderObject(BuildContext context) {
    return RenderAfterLayout(callback: callback);
  }

  @override
  void updateRenderObject(BuildContext context, RenderAfterLayout renderObject) {
    renderObject.callback = callback;
  }
}

/// RenderAfterLayout - 自定义 RenderObject
class RenderAfterLayout extends RenderProxyBox {
  RenderAfterLayout({RenderBox? child, required this.callback}) : super(child);

  ValueChanged<RenderAfterLayout> callback;

  @override
  void performLayout() {
    super.performLayout();
    // 布局完成后，在下一帧调用回调
    // 使用 addPostFrameCallback 确保在布局完成后执行
    WidgetsBinding.instance.addPostFrameCallback((_) {
      callback(this);
    });
  }

  /// 获取组件相对于屏幕的坐标
  Offset get offset => localToGlobal(Offset.zero);

  /// 获取组件相对于指定祖先组件的坐标
  Offset offsetTo(RenderObject ancestor) {
    return localToGlobal(Offset.zero, ancestor: ancestor);
  }
}
