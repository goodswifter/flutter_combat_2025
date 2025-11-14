import 'package:flutter/material.dart';

class NamedRouteHomePage extends StatelessWidget {
  const NamedRouteHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('2.4.5命名路由')),
      body: Center(
        child: ElevatedButton(
          onPressed: () => Navigator.pushNamed(context, 'new_page', arguments: 'hi'),
          child: const Text('打开新页面'),
        ),
      ),
    );
  }
}

class NameRouteNewRoute extends StatelessWidget {
  const NameRouteNewRoute({super.key});

  @override
  Widget build(BuildContext context) {
    //获取路由参数
    final Object? args = ModalRoute.of(context)?.settings.arguments;
    print('args = $args');
    return Scaffold(
      appBar: AppBar(title: const Text('新页面')),
      body: const Center(child: Text('This is new route', style: TextStyle(fontSize: 20.0))),
    );
  }
}
