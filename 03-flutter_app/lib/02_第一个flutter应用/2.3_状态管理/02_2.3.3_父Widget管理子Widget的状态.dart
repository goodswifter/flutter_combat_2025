// ParentWidget 为 TapboxB 管理状态.

//------------------------ ParentWidget --------------------------------

import 'package:flutter/material.dart';

class ParentWidgetB extends StatefulWidget {
  const ParentWidgetB({super.key});

  @override
  State<ParentWidgetB> createState() => _ParentWidgetBState();
}

class _ParentWidgetBState extends State<ParentWidgetB> {
  bool _active = false;

  void _handleTapboxChanged(bool value) {
    setState(() {
      _active = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('2.3.3_父Widget管理子Widget的状态')),
      body: Center(
        child: TapboxB(active: _active, onChanged: _handleTapboxChanged),
      ),
    );
  }
}

//------------------------ TapboxB --------------------------------

class TapboxB extends StatelessWidget {
  const TapboxB({super.key, this.active = false, required this.onChanged});

  final bool active;
  final ValueChanged<bool> onChanged;

  void _handleTap() {
    onChanged(!active);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _handleTap,
      child: Container(
        width: 200.0,
        height: 200.0,
        decoration: BoxDecoration(
          color: active ? Colors.lightGreen[700] : Colors.grey[600],
          border: Border.all(color: Colors.red, width: 2), // 红色边框帮助观察实际尺寸
          borderRadius: BorderRadius.circular(8), // 添加圆角
        ),
        child: Center(
          child: Text(
            active ? 'Active' : 'Inactive',
            style: const TextStyle(fontSize: 20.0, color: Colors.white),
          ),
        ),
      ),
    );
  }
}
