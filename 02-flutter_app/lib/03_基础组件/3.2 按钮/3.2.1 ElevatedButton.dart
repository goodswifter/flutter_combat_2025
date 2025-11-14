import 'package:flutter/material.dart';

class ButtonDemo extends StatelessWidget {
  const ButtonDemo({super.key});

  void _onPressed() {
    print('onPressed');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Button Demo')),
      body: Center(
        child: Column(
          children: <Widget>[
            // 漂浮按钮
            ElevatedButton(onPressed: () {}, child: const Text('ElevatedButton')),
            // 文本按钮
            TextButton(onPressed: () {}, child: const Text('TextButton')),
            // 边框按钮
            OutlinedButton(onPressed: () {}, child: const Text('OutlinedButton')),
            // 图标按钮
            IconButton(
              onPressed: () {},
              style: ButtonStyle(iconSize: WidgetStateProperty.all(50)),
              icon: const Icon(Icons.thumb_up),
            ),
            // 带图标的按钮
            ElevatedButton.icon(
              icon: const Icon(Icons.send),
              label: const Text('发送'),
              onPressed: _onPressed,
            ),
            OutlinedButton.icon(
              icon: const Icon(Icons.add),
              label: const Text('添加'),
              onPressed: _onPressed,
            ),
            TextButton.icon(
              icon: const Icon(Icons.info),
              label: const Text('详情'),
              onPressed: _onPressed,
            ),
          ],
        ),
      ),
    );
  }
}
