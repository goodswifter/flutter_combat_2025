import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Scaffold(
        appBar: AppBar(title: const Text('路由管理示例')),
        body: Center(
          child: TextButton(
            style: TextButton.styleFrom(
              backgroundColor: Colors.blue,
              foregroundColor: Colors.white,
            ),
            child: const Text('open new route', style: TextStyle(fontSize: 20.0)),
            onPressed: () {
              // 导航到新路由
              Navigator.push<void>(
                context,
                MaterialPageRoute<void>(builder: (BuildContext context) => const NewRoute()),
              );
            },
          ),
        ),
      ),
    );
  }
}

class NewRoute extends StatelessWidget {
  const NewRoute({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('New Route')),
      body: const Center(child: Text('This is new route', style: TextStyle(fontSize: 20.0))),
    );
  }
}
