/**
  1. 函数声明
    ```dart
      // 不指定返回类型，此时默认为dynamic，不是bool
      isNoble(int atomicNumber) {
        return _nobleGases[atomicNumber] != null;
      }
    ```

  2. 可选的位置参数
    ```dart
    String say(String from, String msg, [String? device]) {
      var result = '$from says $msg';
      if (device != null) {
        result = '$result with a $device';
      }
      return result;
    }
    ```

  3. 可选的命名参数
    ```dart
      void enableFlags({bool bold = false, bool hidden = false}) {
        // ...
      }

      // 调用时，可以只传入一个参数
      enableFlags(bold: true);
    ```
 */
