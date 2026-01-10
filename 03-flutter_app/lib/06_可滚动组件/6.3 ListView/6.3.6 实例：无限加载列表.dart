import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';

class InfiniteLoadingListPage extends StatelessWidget {
  const InfiniteLoadingListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('无限加载列表')),
      body: const InfiniteListView(),
    );
  }
}

class InfiniteListView extends StatefulWidget {
  const InfiniteListView({super.key});

  @override
  State<InfiniteListView> createState() => _InfiniteListViewState();
}

class _InfiniteListViewState extends State<InfiniteListView> {
  static const String loadingTag = '##loading##'; //表尾标记
  final List<String> _words = <String>[loadingTag];

  @override
  void initState() {
    super.initState();
    _retrieveData();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: _words.length,
      itemBuilder: (BuildContext context, int index) {
        //如果到了表尾
        if (_words[index] == loadingTag) {
          //不足100条，继续获取数据
          if (_words.length - 1 < 100) {
            //获取数据
            _retrieveData();
            //加载时显示loading
            return Container(
              padding: const EdgeInsets.all(16.0),
              alignment: Alignment.center,
              child: const SizedBox(
                width: 24.0,
                height: 24.0,
                child: CircularProgressIndicator(strokeWidth: 2.0),
              ),
            );
          } else {
            //已经加载了100条数据，不再获取数据。
            return Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.all(16.0),
              child: const Text('没有更多了', style: TextStyle(color: Colors.grey)),
            );
          }
        }
        //显示单词列表项
        return ListTile(title: Text(_words[index]));
      },
      separatorBuilder: (BuildContext context, int index) => const Divider(height: .0),
    );
  }

  void _retrieveData() {
    Future<void>.delayed(const Duration(seconds: 2)).then((dynamic _) {
      setState(() {
        //重新构建列表
        _words.insertAll(
          _words.length - 1,
          // 每次生成20个单词
          generateWordPairs().take(20).map((WordPair e) => e.asPascalCase).toList(),
        );
      });
    });
  }
}
