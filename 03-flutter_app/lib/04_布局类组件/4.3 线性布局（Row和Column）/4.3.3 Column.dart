import 'package:flutter/material.dart';

class ColumnDemo extends StatelessWidget {
  const ColumnDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('')),
      // 总宽度为Column占用空间的实际宽度，而实际的宽度取决于子项中宽度最大的Widget。
      body: ConstrainedBox(
        constraints: const BoxConstraints(minWidth: double.infinity),
        child: const Column(
          mainAxisAlignment: .center,
          crossAxisAlignment: .center,
          children: <Widget>[Text('hi'), Text('world')],
        ),
      ),
    );
  }
}
