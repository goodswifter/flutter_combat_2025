import 'package:flutter/material.dart';

class AlignDemo extends StatelessWidget {
  const AlignDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('')),
      body: Center(
        child: Column(
          spacing: 20,
          children: <Widget>[
            Container(
              height: 120.0,
              width: 120.0,
              color: Colors.blue.shade50,
              child: const Align(alignment: Alignment.topRight, child: FlutterLogo(size: 60)),
            ),

            // widthFactor 和 heightFactor 属性用于控制 Align 组件的子组件的宽高比例。
            Container(
              color: Colors.red.shade50,
              child: const Align(
                widthFactor: 2,
                heightFactor: 2,
                alignment: .topRight,
                child: FlutterLogo(size: 60),
              ),
            ),

            // FractionalOffset 组件用于相对于父组件的左上角进行定位。
            Container(
              height: 120.0,
              width: 120.0,
              color: Colors.green[50],
              child: const Align(
                alignment: FractionalOffset(0.2, 0.6),
                child: FlutterLogo(size: 60),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
