import 'package:flutter/material.dart';

class TapboxA extends StatefulWidget {
  const TapboxA({super.key});

  @override
  State<TapboxA> createState() => _TapboxAState();
}

class _TapboxAState extends State<TapboxA> {
  bool _active = false;

  void _handleTap() {
    setState(() {
      _active = !_active;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('2.3.2_Widget管理自身状态')),
      body: Center(
        child: GestureDetector(
          onTap: _handleTap,
          child: Container(
            width: 200.0,
            height: 200.0,
            decoration: BoxDecoration(
              color: _active ? Colors.lightGreen[700] : Colors.grey[600],
              border: Border.all(color: Colors.red, width: 2), // 红色边框帮助观察实际尺寸
              borderRadius: BorderRadius.circular(8), // 添加圆角
            ),
            child: Center(
              child: Text(
                _active ? 'Active' : 'Inactive',
                style: const TextStyle(fontSize: 20.0, color: Colors.white),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
