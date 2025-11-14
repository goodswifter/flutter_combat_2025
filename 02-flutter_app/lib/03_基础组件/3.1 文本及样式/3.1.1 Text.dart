import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class TextDemo extends StatelessWidget {
  const TextDemo({super.key});

  @override
  Widget build(BuildContext context) {
    final TapGestureRecognizer tapRecognizer = TapGestureRecognizer()
      ..onTap = () {
        print('tap!');
      };

    return Scaffold(
      appBar: AppBar(title: const Text('Text Demo')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('Hello, World!', textAlign: TextAlign.left),
            const SizedBox(height: 20),
            Text('Hello, World!' * 14, maxLines: 1, overflow: TextOverflow.ellipsis),
            const SizedBox(height: 20),
            const Text('Hello world', textScaler: TextScaler.linear(1.5)),
            const SizedBox(height: 20),
            Text(
              'Hello world' * 8,
              style: const TextStyle(fontSize: 20.0, color: Colors.blue),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            Text(
              'Hello world',
              style: TextStyle(
                color: Colors.blue,
                fontSize: 18.0,
                height: 1.2,
                fontFamily: 'Courier',
                background: Paint()..color = Colors.yellow,
                decoration: TextDecoration.underline,
                decorationStyle: TextDecorationStyle.dashed,
              ),
            ),

            // 3.1.3 TextSpan
            Text.rich(
              TextSpan(
                children: <InlineSpan>[
                  const TextSpan(text: 'Home: '),
                  TextSpan(
                    text: 'https://flutterchina.club',
                    style: const TextStyle(color: Colors.blue),
                    recognizer: tapRecognizer,
                  ),
                ],
              ),
            ),

            // 3.1.5 字体
            const Text('1234567890', style: TextStyle(fontFamily: 'Din', fontSize: 40)),
          ],
        ),
      ),
    );
  }
}
