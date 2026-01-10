import 'package:flutter/material.dart';

class SingleChildScrollViewTestRoute extends StatelessWidget {
  const SingleChildScrollViewTestRoute({super.key});

  @override
  Widget build(BuildContext context) {
    const String str = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
    return Scaffold(
      appBar: AppBar(title: const Text('滚动列表')),
      body: Scrollbar(
        child: SingleChildScrollView(
          padding: const .all(16.0),
          child: Center(
            child: Column(
              children: str
                  .split('')
                  .map((String c) => Text(c, textScaler: const TextScaler.linear(2.0)))
                  .toList(),
            ),
          ),
        ),
      ),
    );
  }
}
