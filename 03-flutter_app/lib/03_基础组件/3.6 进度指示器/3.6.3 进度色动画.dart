import 'package:flutter/material.dart';

/// 进度色动画示例
/// 插件: https://pub-web.flutter-io.cn/packages/flutter_spinkit
class ProgressColorDemo extends StatefulWidget {
  const ProgressColorDemo({super.key});

  @override
  State<ProgressColorDemo> createState() => _ProgressColorDemoState();
}

class _ProgressColorDemoState extends State<ProgressColorDemo> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this, // 注意State类需要混入SingleTickerProviderStateMixin（提供动画帧计时/触发器）
      duration: const Duration(seconds: 3), // 动画持续时间
    );
    _animationController.forward(); // 开始动画
    _animationController.addListener(() => setState(() => {}));
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('进度色动画示例')),
      body: Column(
        mainAxisAlignment: .center,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(16),
            child: LinearProgressIndicator(
              backgroundColor: Colors.grey[200],
              valueColor: ColorTween(
                begin: Colors.grey,
                end: Colors.red,
              ).animate(_animationController), // 从灰色变成蓝色
              value: _animationController.value,
            ),
          ),
        ],
      ),
    );
  }
}
