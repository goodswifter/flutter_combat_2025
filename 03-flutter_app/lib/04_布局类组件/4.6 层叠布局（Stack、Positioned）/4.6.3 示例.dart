import 'package:flutter/material.dart';

/// Stack(层叠布局)、Positioned(绝对定位)
class StackPositionedDemo extends StatelessWidget {
  const StackPositionedDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('层叠布局和绝对定位')),
      // 通过ConstrainedBox来确保Stack占满屏幕
      body: ConstrainedBox(
        constraints: const .expand(),
        child: Stack(
          alignment: .center, // 指定未定位或部分定位widget的对齐方式
          children: <Widget>[
            Container(
              color: Colors.red,
              child: const Text('Hello world', style: TextStyle(color: Colors.white)),
            ),
            const Positioned(left: 18.0, child: Text('I am Jack')),
            const Positioned(top: 18.0, child: Text('Your friend')),
          ],
        ),
      ),
    );
  }
}
