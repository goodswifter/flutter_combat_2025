import 'package:flutter/material.dart';

class CheckBoxDemo extends StatefulWidget {
  const CheckBoxDemo({super.key});

  @override
  State<CheckBoxDemo> createState() => _CheckBoxDemoState();
}

class _CheckBoxDemoState extends State<CheckBoxDemo> {
  bool _switchSelected = true; // 维护单选开关状态
  bool _checkboxSelected = true; // 维护复选框状态

  void _switchOnChanged(bool? value) {
    setState(() {
      _switchSelected = value ?? false;
    });
  }

  void _checkboxOnChanged(bool? value) {
    setState(() {
      _checkboxSelected = value ?? false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('CheckBoxDemo')),
      body: Center(
        child: Column(
          children: <Widget>[
            Switch(value: _switchSelected, onChanged: _switchOnChanged),
            Checkbox(value: _checkboxSelected, onChanged: _checkboxOnChanged),

            // 方法一：使用 SwitchListTile（推荐）
            SwitchListTile(
              title: const Text('开关'),
              subtitle: Text('当前状态：${_switchSelected ? "开启" : "关闭"}'),
              value: _switchSelected,
              onChanged: _switchOnChanged,
            ),
            const SizedBox(height: 20),
            // 方法二：使用 Row 组合
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text('开关状态：'),
                Switch(
                  value: _switchSelected,
                  onChanged: (bool? value) {
                    setState(() {
                      _switchSelected = value ?? false;
                    });
                  },
                ),
              ],
            ),
            const SizedBox(height: 20),
            // 复选框示例（也一起优化了）
            CheckboxListTile(
              title: const Text('复选框'),
              subtitle: Text('当前状态：${_checkboxSelected ? "选中" : "未选中"}'),
              value: _checkboxSelected,
              onChanged: _checkboxOnChanged,
            ),
          ],
        ),
      ),
    );
  }
}
