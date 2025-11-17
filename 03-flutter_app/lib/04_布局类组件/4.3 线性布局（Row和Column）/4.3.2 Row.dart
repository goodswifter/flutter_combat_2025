import 'package:flutter/material.dart';

class RowDemo extends StatelessWidget {
  const RowDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('')),
      body: Center(
        child: Column(
          // 测试Row对齐方式，排除Column默认居中对齐的干扰
          crossAxisAlignment: .start,
          children: <Widget>[
            const Row(
              mainAxisAlignment: .center,
              children: <Widget>[Text(' hello world '), Text(' I am Jack ')],
            ),
            const Row(
              mainAxisSize: .min,
              mainAxisAlignment: .center,
              children: <Widget>[Text(' hello world '), Text(' I am Jack ')],
            ),
            Container(
              color: Colors.blue,
              child: const Row(
                mainAxisAlignment: .end, // 失效
                textDirection: .rtl,
                children: <Widget>[Text(' hello world '), Text(' I am Jack ')],
              ),
            ),
            const Row(
              crossAxisAlignment: .start,
              verticalDirection: .up, // 需要配置垂直方向的排列方式, 这个属性才生效
              children: <Widget>[
                Text(' hello world ', style: TextStyle(fontSize: 30.0)),
                Text(' I am Jack '),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
