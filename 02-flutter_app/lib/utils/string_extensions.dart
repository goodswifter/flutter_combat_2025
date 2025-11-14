/// 字符串扩展方法
extension StringExtension on String {
  /// 重复字符串指定次数
  ///
  /// 示例：
  /// ```dart
  /// String result = 'Hello' * 3; // 'HelloHelloHello'
  /// ```
  String operator *(int times) {
    if (times <= 0) return '';
    return List<String>.filled(times, this).join('');
  }

  /// 重复字符串并用分隔符连接
  ///
  /// 示例：
  /// ```dart
  /// String result = 'Hello'.repeat(3, separator: '-'); // 'Hello-Hello-Hello'
  /// ```
  String repeat(int times, {String separator = ''}) {
    if (times <= 0) return '';
    return List<String>.filled(times, this).join(separator);
  }
}
