// ignore_for_file: file_names
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, this.title = '01_state的生命周期'});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('点击按钮会触发 didUpdateWidget:'),
            Text('当前计数: $_counter', style: Theme.of(context).textTheme.headlineMedium),
            const SizedBox(height: 20),
            // 传递 _counter 作为 initialCount，每次 _counter 改变时会触发 didUpdateWidget
            CounterWidget(initialCount: _counter),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}

// 生命周期示例
class CounterWidget extends StatefulWidget {
  const CounterWidget({super.key, this.initialCount = 0});

  final int initialCount;

  @override
  State<CounterWidget> createState() => _CounterWidgetState();
}

class _CounterWidgetState extends State<CounterWidget> {
  int _counter = 0;

  /// 第一次加载
  /// flutter: initState
  /// flutter: didChangeDependencies
  /// flutter: build

  /// 热重载
  /// flutter: reassemble
  /// flutter: build

  /// 热重启
  /// flutter: initState
  /// flutter: didChangeDependencies
  /// flutter: build
  /// flutter: reassemble
  /// flutter: build

  /// setState
  /// flutter: build

  /// 移除页面, 页面卸载
  /// flutter: reassemble
  /// flutter: deactivate
  /// flutter: dispose

  @override
  // 当 widget 第一次插入到 widget 树时会被调用
  void initState() {
    super.initState();

    // 初始化状态
    _counter = widget.initialCount;
    print('initState');
  }

  @override
  // 当State对象的依赖发生变化时会被调用
  void didChangeDependencies() {
    super.didChangeDependencies();

    print('didChangeDependencies');
  }

  @override
  // 此回调是专门为了开发调试而提供的，在热重载(hot reload)时会被调用，此回调在Release模式下永远不会被调用。
  void reassemble() {
    super.reassemble();

    print('reassemble');
  }

  @override
  // 1. 父组件重新构建并传递不同的属性(第一次传递参数也会触发)
  // 当这些情况发生时会触发 didUpdateWidget：
  // CounterWidget(initialCount: 0)  // 第一次创建
  // CounterWidget(initialCount: 1)  // 属性变化
  // CounterWidget(initialCount: 2)  // 属性变化
  void didUpdateWidget(CounterWidget oldWidget) {
    super.didUpdateWidget(oldWidget);

    print(
      'didUpdateWidget: oldWidget.initialCount = ${oldWidget.initialCount}, newWidget.initialCount = ${widget.initialCount}',
    );

    // 如果 initialCount 发生了变化，更新内部状态
    if (oldWidget.initialCount != widget.initialCount) {
      _counter = widget.initialCount;
      print('initialCount 发生变化，更新内部计数器');
    }
  }

  @override
  Widget build(BuildContext context) {
    print('build');
    return TextButton(
      onPressed: () => setState(() => _counter++),
      child: Text('$_counter', style: Theme.of(context).textTheme.headlineMedium),
    );
  }

  @override
  // 当 State 对象从树中被移除时，会调用此回调。
  // 如果移除后没有重新插入到树中则紧接着会调用dispose()方法。
  deactivate() {
    super.deactivate();

    print('deactivate');
  }

  @override
  // 当 State 对象从树中被永久移除时调用；通常在此回调中释放资源。s
  dispose() {
    super.dispose();

    print('dispose');
  }
}
