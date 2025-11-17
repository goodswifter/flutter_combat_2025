import 'package:flutter/material.dart';

///
/// 特殊情况：
/// 如果Row里面嵌套Row，或者Column里面再嵌套Column，
/// 那么只有最外面的Row或Column会占用尽可能大的空间，里面Row或Column所占用的空间为实际大小
class SpecialCaseDemo extends StatelessWidget {
  const SpecialCaseDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('')),
      body: Container(
        color: Colors.green,
        child: Padding(
          padding: const .all(16.0),
          child: Column(
            crossAxisAlignment: .start,
            mainAxisSize: .max, // 有效，外层Column高度为整个屏幕
            children: <Widget>[
              // 如果要让里面的Column占满外部Column，可以使用 Expanded 组件：
              Container(
                color: Colors.red,
                child: const Column(
                  mainAxisSize: .max, // 无效，内层Colum高度为实际高度
                  children: <Widget>[Text('hello world '), Text('I am Jack ')],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
