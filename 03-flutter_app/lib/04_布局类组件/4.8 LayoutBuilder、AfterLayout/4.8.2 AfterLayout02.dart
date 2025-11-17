import 'package:flutter/material.dart';
import 'package:flutter_template/widgets/render_after_layout.dart';

/// AfterLayout(延迟布局构建器) 组件用于在组件布局完成后执行一些操作。
/// 2. 获取组件相对于某个父组件的坐标
class AfterLayoutDemo2 extends StatefulWidget {
  const AfterLayoutDemo2({super.key});

  @override
  State<AfterLayoutDemo2> createState() => _AfterLayoutDemo2State();
}

class _AfterLayoutDemo2State extends State<AfterLayoutDemo2> {
  String _text = 'flutter 实战 ';
  Size _size = Size.zero;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('AfterLayout 示例')),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Builder(
                builder: (BuildContext context) {
                  return GestureDetector(
                    child: const Text(
                      'Text1: 点我获取我的大小',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.blue),
                    ),
                    onTap: () => print('Text1: ${context.size}'),
                  );
                },
              ),
            ),
            AfterLayout(
              callback: (RenderAfterLayout ral) {
                print('Text2： ${ral.size}, ${ral.offset}');
              },
              child: const Text('Text2：flutter@wendux'),
            ),
            Builder(
              builder: (BuildContext context) {
                return Container(
                  color: Colors.grey.shade200,
                  alignment: Alignment.center,
                  width: 100,
                  height: 100,
                  child: AfterLayout(
                    callback: (RenderAfterLayout ral) {
                      final Offset offset = ral.localToGlobal(
                        Offset.zero,
                        ancestor: context.findRenderObject(),
                      );
                      print('A 在 Container 中占用的空间范围为：${offset & ral.size}');
                    },
                    child: const Text('A'),
                  ),
                );
              },
            ),
            const Divider(),
            AfterLayout(
              child: Text(_text),
              callback: (RenderAfterLayout value) {
                setState(() {
                  //更新尺寸信息
                  _size = value.size;
                });
              },
            ),
            //显示上面 Text 的尺寸
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Text('Text size: $_size ', style: const TextStyle(color: Colors.blue)),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  _text += 'flutter 实战 ';
                });
              },
              child: const Text('追加字符串'),
            ),
          ],
        ),
      ),
    );
  }
}
