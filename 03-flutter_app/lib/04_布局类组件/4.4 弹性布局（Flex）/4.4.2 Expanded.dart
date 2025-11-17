import 'package:flutter/material.dart';

class ExpandedDemo extends StatelessWidget {
  const ExpandedDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('')),
      body: Center(
        child: Column(
          children: <Widget>[
            // Flex的两个子widget按 1:2 来占据水平空间
            Flex(
              direction: .horizontal,
              children: <Widget>[
                Expanded(flex: 1, child: Container(height: 30.0, color: Colors.red)),
                Expanded(flex: 2, child: Container(height: 30.0, color: Colors.green)),
              ],
            ),

            Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: SizedBox(
                height: 100.0,
                // Flex的三个子widget，在垂直方向按2：1：1来占用100像素的空间
                child: Flex(
                  direction: .vertical,
                  children: <Widget>[
                    Expanded(flex: 2, child: Container(color: Colors.red)),
                    // 间隔器: Spacer 组件会按比例分配剩余空间
                    const Spacer(flex: 1),
                    Expanded(flex: 1, child: Container(color: Colors.green)),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
