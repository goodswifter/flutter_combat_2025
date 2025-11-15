import 'package:flutter/material.dart';

class LinearProgressIndicatorDemo extends StatelessWidget {
  const LinearProgressIndicatorDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('进度指示器示例')),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            spacing: 20,
            mainAxisAlignment: .center,
            children: <Widget>[
              // 模糊进度条(会执行一个动画)
              SizedBox(
                height: 5,
                child: LinearProgressIndicator(
                  borderRadius: .circular(10),
                  backgroundColor: Colors.grey[200],
                  valueColor: const AlwaysStoppedAnimation<Color>(Colors.red),
                ),
              ),
              // 进度条显示50%
              LinearProgressIndicator(
                backgroundColor: Colors.grey[200],
                valueColor: const AlwaysStoppedAnimation<Color>(Colors.blue),
                value: .5,
              ),

              // 模糊进度条(会执行一个旋转动画)
              CircularProgressIndicator(
                strokeWidth: 5,
                strokeCap: .round,
                backgroundColor: Colors.grey[200],
                valueColor: const AlwaysStoppedAnimation<Color>(Colors.amber),
              ),
              // 进度条显示50%，会显示一个半圆
              CircularProgressIndicator(
                backgroundColor: Colors.grey[200],
                valueColor: const AlwaysStoppedAnimation<Color>(Colors.blue),
                value: .5,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
