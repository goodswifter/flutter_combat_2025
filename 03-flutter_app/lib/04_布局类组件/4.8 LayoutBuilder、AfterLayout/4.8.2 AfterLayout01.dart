import 'package:flutter/material.dart';
import 'package:flutter_template/widgets/render_after_layout.dart';

/// AfterLayout(延迟布局构建器) 组件用于在组件布局完成后执行一些操作。
/// 1. 获取组件大小和相对于屏幕的坐标
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
