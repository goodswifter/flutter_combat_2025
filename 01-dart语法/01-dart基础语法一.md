# [官方链接](https://dart.cn/language)

# 一、Dart 介绍和安装

## 1.1 VSCode 配置

- Dart 和 Flutter 插件是为 Flutter 开发准备的
- Atom One Dark Theme 是我个人比较喜欢的一个主题
- Code Runner 可以点击右上角的按钮让我快速运行代码

# 二、Hello Dart

## 2.1 Hello World

- 在 VSCode 中新建一个 helloWorld.dart 文件

```dart
main(List<String> args) {
  print('Hello World');
}
```

在终端执行 dart helloWorld.dart，就能看到 Hello World 的结果了。

## 2.2 程序的分析

- 一、Dart 语言的入口也是 main 函数，并且必须显示的进行定义；

- 二、Dart 的入口函数 main 是没有返回值的；

- 三、传递给 main 的命令行参数，是通过 List<String>完成的。
  - 从字面值就可以理解 List 是 Dart 中的集合类型。
  - 其中的每一个 String 都表示传递给 main 的一个参数；
- 四、定义字符串的时候，可以使用单引号或双引号；

- 五、每行语句必须使用分号结尾，很多语言并不需要分号，比如 Swift、JavaScript；

# 三、定义变量

## 3.2. 类型推导(Type Inference)

```dart
var/dynamic/const/final 变量名称 = 赋值;
```

### 3.3.1. var 的使用

- runtimeType 用于获取变量当前的类型
- var 的错误用法:

```dart
var age = 18
age = 'why' // 不可以将String赋值给一个int类型
```

### 3.3.2. dynamic & Object 的使用

#### dynamic

- dynamic 可以代表任意类型
- 但是在开发中, 通常情况下不使用 dynamic, 因为类型的变量会带来潜在的危险

```dart
dynamic name = 'coderwhy';
print(name.runtimeType); // String
name = 18;
print(name.runtimeType); // int
// 这种情况就会报错
print(name.substring(1));
```

#### Object

- 默认情况下, 所有的类都继承 Object 类

#### Object 和 dynamic 的区别

- Object 调用子类方法时, 编译期间就会报错
- dynamic 调用子类方法时, 编译时不会报错, 但运行期间存在安全隐患

### 3.3.3. final&const 的使用

- final 和 const 都是用于定义常量的, 也就是定义之后值都不可以修改

```dart
final name = 'coderwhy';
name = 'kobe'; // 错误做法

const age = 18;
age = 20; // 错误做法
```

- final 和 const 有什么区别呢?

  - const 在赋值时, 赋值的内容必须是在编译期间就确定下来的

  - final 在赋值时, 可以动态获取, 比如赋值一个函数

```dart
String getName() {
  return 'coderwhy';
}

main(List<String> args) {
  const name = getName(); // 错误的做法, 因为要执行函数才能获取到值
  final name = getName(); // 正确的做法
}
```

- final 和 const 小案例:
  - const 放在赋值语句的右边，可以共享对象，提高性能:

```dart
// Person 类
class Person {
  final String name;
  const Person(this.name);
}

main(List<String> args) {
  // 判断两个对象是不是同一个对象
  // new 可以省略
  final p1 = new Person("abc");
  final p2 = Person("abc");
  print(identical(p1, p2)); // false

  const p3 = const Person("why");
  const p4 = const Person("why");
  print(identical(p3, p4)); // true

  // 如果前面用const修饰, 后面的const可以省略
  const p5 = Person("why");
  const p6 = Person("why");
  print(identical(p5, p6)); // true

  // 如果前面用final修饰, 后面的const不能省略
  final p7 = const Person("why");
  final p8 = const Person("why");
  print(identical(p7, p8)); // true
}
```

# 四. 数据类型

## 4.1. 数字类型

- 整数用 `int`，浮点数用 `double`
- 字符串和数字之间的转化

```dart
// 字符串和数字转化
// 1.字符串转数字
var one = int.parse('111')
var two = double.parse('12.22')
print('${one} ${one.runtimeType}') // 111 int
print('${two} ${two.runtimeType}') // 12.22 double

// 2.数字转字符串
var num1 = 123
var num2 = 123.456
var num1Str = num1.toString()
var num2Str = num2.toString()
var num2StrD = num2.toStringAsFixed(2) // 保留两位小数
print('${num1Str} ${num1Str.runtimeType}') // 123 String
print('${num2Str} ${num2Str.runtimeType}') // 123.456 String
print('${num2StrD} ${num2StrD.runtimeType}') // 123.46 String
```

## 4.2. 布尔类型

- 没有非零即真

## 4.3. 字符串类型

```dart
// 1.定义字符串的方式
var s1 = 'Hello World'; // Hello World
var s2 = "Hello Dart"; // Hello Dart
var s3 = 'Hello\'Fullter'; // Hello'Fullter
var s4 = "Hello'Fullter"; // Hello'Fullter

// 2.表示多行字符串的方式
var message1 = '''
哈哈哈
呵呵呵
嘿嘿嘿''';

// 3.拼接其他变量
var name = 'coderwhy';
var age = 18;
var height = 1.88;
print('my name is ${name}, age is $age, height is $height');
```

## 4.4. 集合类型

### 4.4.1. 集合类型的定义

#### List

```dart
// List定义
// 1.使用类型推导定义
var letters = ['a', 'b', 'c', 'd'];
print('$letters ${letters.runtimeType}');

// 2.明确指定类型
List<int> numbers = [1, 2, 3, 4];
print('$numbers ${numbers.runtimeType}');
```

#### Set

- 其实，也就是把 `[ ]` 换成 `{ }` 就好了。

- `Set` 和 `List` 最大的两个不同就是：`Set` 是无序的，并且元素是不重复的。

```dart
// Set的定义
// 1.使用类型推导定义
var lettersSet = {'a', 'b', 'c', 'd'};
print('$lettersSet ${lettersSet.runtimeType}');

// 2.明确指定类型
Set<int> numbersSet = {1, 2, 3, 4};
print('$numbersSet ${numbersSet.runtimeType}');
```

#### Map 是我们常说的字典类型

```dart
// Map的定义
// 1.使用类型推导定义
var infoMap1 = {'name': 'why', 'age': 18};
print('$infoMap1 ${infoMap1.runtimeType}');

// 2.明确指定类型
Map<String, Object> infoMap2 = {'height': 1.88, 'address': '北京市'};
print('$infoMap2 ${infoMap2.runtimeType}');
```

### 4.4.2. 集合的常见操作

- 第一类，获取长度 `length`

```dart
// 获取集合的长度
list.length
```

- 第二类, 是添加/删除/包含操作

```dart
// 添加/删除/包含
list.add(5)
list.remove(1)
list.contains(2)

// List根据index删除元素
list.removeAt(2)
```

- 第三类，是 Map 的操作

```dart
// 1.根据key获取value
print(infoMap1['name']); // why

// 2.获取所有的entries
print('${infoMap1.entries} ${infoMap1.entries.runtimeType}');
// (MapEntry(name: why), MapEntry(age: 18)) MappedIterable<String, MapEntry<String, Object>>

// 3.获取所有的keys
print('${infoMap1.keys} ${infoMap1.keys.runtimeType}'); // (name, age) _CompactIterable<String>

// 4.获取所有的values
print('${infoMap1.values} ${infoMap1.values.runtimeType}'); // (why, 18) _CompactIterable<Object>

// 5.判断是否包含某个key或者value
print('${infoMap1.containsKey('age')} ${infoMap1.containsValue(18)}'); // true true

// 6.根据key删除元素
infoMap1.remove('age');
print('${infoMap1}'); // {name: why}
```

# 五. 函数

## 5.1 箭头函数

- 注意, 这里面只能是一个表达式, 不能是一个语句

```dart
sum(num1, num2) => num1 + num2;
```

## 5.2. 函数的参数问题

### 5.2.1. 可选参数

```dart
命名可选参数: {param1, param2, ...}
位置可选参数: [param1, param2, ...]
```

### 5.2.2. 参数默认值

- 注意, 只有可选参数才可以有默认值, 必选参数不能有默认值

```dart
// 参数的默认值
printInfo4(String name, {int age = 18, double height=1.88}) {
  print('name=$name age=$age height=$height');
}
```

## 5.3. 函数是一等公民

- 就意味着你可以将函数赋值给一个变量, 也可以将函数作为另外一个函数的参数或者返回值来使用.

```dart

main(List<String> args) {
  // 1.将函数赋值给一个变量
  var bar = foo;
  print(bar);

  // 2.将函数作为另一个函数的参数
  test(foo);

  // 3.将函数作为另一个函数的返回值
  var func = getFunc();
  func('kobe');
}

// 1.定义一个函数
foo(String name) {
  print('传入的name:$name');
}

// 2.将函数作为另外一个函数的参数
test(Function func) {
  func('coderwhy');
}

// 3.将函数作为另一个函数的返回值
getFunc() {
  return foo;
}
```

## 5.4. 匿名函数的使用

```dart
// 3.使用forEach遍历: 匿名函数
movies.forEach((item) {
  print(item);
});
// 箭头函数也属于匿名函数的一种
movies.forEach((item) => print(item));
```

## 5.5. 词法作用域

- dart 中的词法有自己明确的作用域范围，它是根据代码的结构({})来决定作用域范围的
- 优先使用自己作用域中的变量，如果没有找到，则一层层向外查找。

## 5.6. 词法闭包

- 概念：定义在函数里面的函数就是闭包，闭包也是一个对象。
- 闭包可以访问其词法范围内的变量，即使函数在其他地方被使用，也可以正常的访问。

```dart
main(List<String> args) {
  // 这也是一个闭包
  makeAdder(num addBy) {
    // 这个是匿名函数，其他就是一个闭包
    return (num i) {
      return i + addBy;
    };
  }

  var adder2 = makeAdder(2);
  print(adder2(10)); // 12
  print(adder2(6)); // 8

  var adder5 = makeAdder(5);
  print(adder5(10)); // 15
  print(adder5(6)); // 11
}
```

## 5.7. 返回值问题

- 所有函数都返回一个值。如果没有指定返回值，则语句返回 null;隐式附加到函数体。

```dart
main(List<String> args) {
  print(foo()); // null
}

foo() {
  print('foo function');
}
```
