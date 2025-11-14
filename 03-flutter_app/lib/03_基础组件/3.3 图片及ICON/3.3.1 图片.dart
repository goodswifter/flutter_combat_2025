import 'package:flutter/material.dart';
import 'package:flutter_template/const/r.dart';

class ImageDemo extends StatelessWidget {
  const ImageDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Image Demo')),
      body: Center(
        child: Column(
          children: <Widget>[
            // 1. 从本地资源加载图片
            const Image(image: AssetImage(R.ASSETS_APP_LOGO_WEBP), width: 100.0),
            const SizedBox(height: 20),
            Image.asset(R.ASSETS_APP_LOGO_WEBP, width: 100.0),
            const SizedBox(height: 20),

            // 2. 从网络加载图片
            const Image(
              image: NetworkImage('https://avatars2.githubusercontent.com/u/20411648?s=460&v=4'),
              width: 100.0,
            ),
            const SizedBox(height: 20),
            Image.network(
              'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg',
              width: 100.0,
            ),
            const SizedBox(height: 20),

            // 3. 字体图标
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              spacing: 20,
              children: <Widget>[
                Icon(Icons.account_balance, color: Colors.green),
                Icon(Icons.error, color: Colors.red),
                Icon(Icons.fingerprint, color: Colors.green),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
