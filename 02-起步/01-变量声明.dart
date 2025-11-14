/**
 1. dynamic 和 Object 的区别
    dynamic 声明的对象编译器会提供所有可能的组合, 而Object声明的对象只能使用 Object 的属性与方法, 否则编译器会报错
 注意: 
    dynamic a = "";
    print(a.xx); // a是字符串，没有"xx"属性，编译时不会报错，运行时会报错

  2. 常量声明: final(运行时常量) 和 const(编译时常量)
    注意: final 和 const 声明的变量只能赋值一次
    final 声明的变量可以在运行时再确定值，const 声明的变量必须在声明时确定值

  3. late 关键字
    late 关键字用于声明一个变量，这个变量在声明时不会立即初始化，而是在第一次使用时才初始化
    注意: 
      late 关键字只能用于声明变量，不能用于声明函数
    late int k;
    k = 9;
  
  4. 空安全（null-safety）
    int? j; // 定义为可空类型，对于可空变量，我们在使用前必须判空。
    fun?.call() // fun 不为空时则会被调用
 */

void main(List<String> args) {
  // test1();
  test2();

  // 运行时才知道
  final now = DateTime.now();
  print(now);

  // const: 必须在编译时就确定
  const pi = 3.14159;
  // 编译报错
  // const now2 = DateTime.now();
  print("const pi: $pi");

  // 可选的位置参数
  say('Bob', 'Howdy'); //结果是： Bob says Howdy

  // 可选的命名参数
  enableFlags(bold: true);
}

String say(String from, String msg, [String? device]) {
  var result = '$from says $msg';
  if (device != null) {
    result = '$result with a $device';
  }
  return result;
}

// 设置[bold]和[hidden] 可选的命名参数
void enableFlags({bool bold = false, bool hidden = false}) {
  // ...
}

dynamic a;
Object b = "";
void test2() {
  a = "";
  printLengths();
  // 运行时报错
  print(a.xxx);
}

printLengths() {
  // 正常
  print(a.length);
  // 编译报错
  // 报错 The getter 'length' is not defined for the class 'Object'
  // print(b.length);
}
