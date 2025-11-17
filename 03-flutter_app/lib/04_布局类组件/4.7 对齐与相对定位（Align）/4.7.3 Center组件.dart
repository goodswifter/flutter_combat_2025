import 'package:flutter/material.dart';

class CenterDemo extends StatelessWidget {
  const CenterDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('')),
      body: const Column(
        spacing: 20,
        children: <Widget>[
          DecoratedBox(
            decoration: BoxDecoration(color: Colors.red),
            child: Center(child: Text('xxx')),
          ),
          DecoratedBox(
            decoration: BoxDecoration(color: Colors.red),
            child: Center(widthFactor: 1, heightFactor: 1, child: Text('xxx')),
          ),
        ],
      ),
    );
  }
}
