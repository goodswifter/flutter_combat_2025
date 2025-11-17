import 'package:flutter/material.dart';

/// Stack(层叠布局)、Positioned(绝对定位)
class StackPositionedDemo2 extends StatelessWidget {
  const StackPositionedDemo2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('层叠布局和绝对定位')),
      // 通过ConstrainedBox来确保Stack占满屏幕
      body: Stack(
        fit: .expand,
        alignment: .center,
        children: <Widget>[
          const Positioned(left: 18.0, child: Text('I am Jack')),
          Container(
            color: Colors.red,
            child: const Text('Hello world', style: TextStyle(color: Colors.white)),
          ),
          const Positioned(top: 18.0, child: Text('Your friend')),
        ],
      ),
    );
  }
}
