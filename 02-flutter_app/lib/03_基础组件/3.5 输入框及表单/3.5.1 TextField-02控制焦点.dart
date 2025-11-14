import 'package:flutter/material.dart';

class TextFieldDemo2 extends StatefulWidget {
  const TextFieldDemo2({super.key});

  @override
  State<TextFieldDemo2> createState() => _TextFieldDemo2State();
}

class _TextFieldDemo2State extends State<TextFieldDemo2> {
  // 移动焦点和隐藏焦点
  FocusNode focusNode1 = FocusNode();
  FocusNode focusNode2 = FocusNode();
  FocusScopeNode? focusScopeNode;

  // 通过controller监听
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('TextFieldDemo')),
      body: GestureDetector(
        // 点击空白区域取消焦点
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        // 让GestureDetector能响应空白区域的点击
        behavior: HitTestBehavior.opaque,
        child: Container(
          width: double.infinity,
          height: double.infinity,
          padding: const EdgeInsets.all(16.0),
          child: Theme(
            data: ThemeData(primaryColor: Colors.red),
            child: Column(
              spacing: 20.0,
              children: <Widget>[
                const Text(
                  '2. 移动焦点',
                  style: TextStyle(fontSize: 26.0, fontWeight: FontWeight.bold),
                ),
                TextField(
                  autofocus: true,
                  focusNode: focusNode1,
                  decoration: const InputDecoration(
                    labelText: 'input1',
                    hintText: 'input1',
                    prefixIcon: Icon(Icons.lock),
                  ),
                ),
                TextField(
                  focusNode: focusNode2,
                  decoration: const InputDecoration(
                    labelText: 'input2',
                    hintText: 'input2',
                    prefixIcon: Icon(Icons.lock),
                    // 未获得焦点下划线设为灰色
                    enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.red)),
                    //获得焦点下划线设为蓝色
                    focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.blue)),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    //将焦点从第一个TextField移到第二个TextField
                    // 这是一种写法 FocusScope.of(context).requestFocus(focusNode2);
                    // 这是第二种写法
                    focusScopeNode ??= FocusScope.of(context);
                    focusScopeNode?.requestFocus(focusNode2);
                  },
                  child: const Text('移动焦点'),
                ),
                ElevatedButton(
                  onPressed: () {
                    // 当所有编辑框都失去焦点时键盘就会收起
                    // focusNode1.unfocus();
                    // focusNode2.unfocus();

                    // 方式2:
                    FocusScope.of(context).unfocus();
                  },
                  child: const Text('隐藏键盘'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
