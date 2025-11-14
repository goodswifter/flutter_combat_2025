# 一. 运算符

## 1.1. 除法、整除、取余(取模)运算

```dart
var num = 7;
print(num / 3); // 除法操作, 结果2.3333..
print(num ~/ 3); // 整除操作, 结果2;
print(num % 3); // 取余操作, 结果1;
```

## 1.2. ??= 赋值操作

- dart 有一个很多语言都不具备的赋值运算符：
  - 当变量为 null 时，使用后面的内容进行赋值。
  - 当变量有值时，使用自己原来的值。

## 1.3. 条件运算符：

- Dart 中包含一直比较特殊的条件运算符：`expr1 ?? expr2`
  - 如果 expr1 是 null，则返回 expr2 的结果;
  - 如果 expr1 不是 null，直接使用 expr1 的结果。

## 1.4. 级联语法：

```dart
  // ..
  var p = Person()
    ..name = "zad"
    ..eat()
    ..run();

  print(p);
```

# 三. 类和对象

## 3.1. 类的定义

在 Dart 中，定义类用 class 关键字。

类通常有两部分组成：成员（member）和方法（method）。

定义类的伪代码如下：

```dart
class 类名 {
  类型 成员名;
  返回值类型 方法名(参数列表) {
    方法体
  }
}
```

- 这里有一个注意点: 我们在方法中使用属性(成员/实例变量)时，`并没有加this` ；
- Dart 的开发风格中，在方法中通常使用属性时，`会省略this` ，但是 `有命名冲突` 时，`this不能省略`；

- 注意：从 Dart2 开始，new 关键字可以省略

```dart
// 1.创建类的对象
var p = new Person() // 直接使用Person()也可以创建
```

## 3.2. 构造方法

### 3.2.1. 普通构造方法

我们知道, 当通过类创建一个对象时，会调用这个类的构造方法。

- 当类中 `没有明确指定构造方法` 时，将默认拥有一个 `无参的构造方法` 。
- 前面的 Person 中我们就是在调用这个构造方法.

我们也可以根据自己的需求，定义自己的构造方法:

- **注意一** : 当有了自己的构造方法时，默认的构造方法将会失效，不能使用

  - 当然，你可能希望明确的写一个默认的构造方法，也不会和我们自定义的构造方法冲突；
  - 这是因为 Dart 本身 `不支持函数的重载`（名称相同, 参数不同的方式）。

- **注意二** : 这里我还实现了 toString 方法

```dart
class Person {
  String name;
  int age;

  Person(String name, int age) {
    this.name = name;
    this.age = age;
  }

  @override
  String toString() {
    return 'name=$name age=$age';
  }
}
```

另外，在实现构造方法时，通常做的事情就是通过 **参数给属性** s赋值

为了简化这一过程, Dart 提供了一种更加简洁的语法糖形式.

上面的构造方法可以优化成下面的写法：

```dart
Person(String name, int age) {
   this.name = name;
   this.age = age;
 }
 // 等同于
 Person(this.name, this.age);
```

### 3.2.2. 命名构造方法

```dart
// 命名构造函数
Person.withNameAgeHeight(this.name, this.age, this.height);
Person.fromMap(Map<String, dynamic> map) {
  this.name = map["name"];
  this.age = map["age"];
  this.height = map["height"];
}
```

### 3.2.3. 初始化列表

```dart
class Point {
  final num x;
  final num y;
  final num distance;

  // 错误写法
  // Point(this.x, this.y) {
  //   distance = sqrt(x * x + y * y);
  // }

  // 正确的写法
  Point(this.x, this.y): distance = sqrt(x * x + y * y);
}
```

- 另一种初始化的方式

```dart
class Person {
  final String name;
  final int age;

  // 方式一和方式二的区别:
  // 方式一: 应用更广泛
  // 方式二: 有局限性, 不能使用表达式, 如三目运算符

  // 方式一
  // Person(this.name, {int age}): this.age = age ?? 10 { }

  // 方式二
  Person(this.name, {this.age = 10});
}
```

### 3.2.4. 重定向构造方法

- 在某些情况下, 我们希望在一个构造方法中去调用另外一个构造方法, 这个时候可以使用重定向构造方法：
  - 在一个构造函数中，去调用另外一个构造函数（注意：是在冒号后面使用 this 调用）

```dart
class Person {
  String name;
  int age;

  Person(this.name, this.age);
  Person.fromName(String name) : this(name, 0);
}
```

### 3.2.5. 常量构造方法

- 如果将构造方法前加 const 进行修饰，那么可以保证同一个参数，创建出来的对象是相同的
- 常量构造方法的所有属性, 必须是 final 常量

```dart
main(List<String> args) {
  var p1 = const Person('why');
  var p2 = const Person('why');
  print(identical(p1, p2)); // true
}

class Person {
  final String name;

  const Person(this.name);
}
```

- 注意一：拥有常量构造方法的类中，所有的成员变量必须是 final 修饰的.

- 注意二: 为了可以通过常量构造方法，创建出相同的对象，不再使用 new 关键字，而是使用 const 关键字

  - 如果是将结果赋值给 const 修饰的标识符时，const 可以省略.

### 3.2.6. 工厂构造方法

```dart
main(List<String> args) {
  var p1 = Person('why');
  var p2 = Person('why');
  print(identical(p1, p2)); // true
}

class Person {
  String name;

  // 用来做缓存, 保证同一个参数获取的对象是一样的
  static final Map<String, Person> _cache = <String, Person>{};

  factory Person(String name) {
    if (_cache.containsKey(name)) {
      return _cache[name]!;
    } else {
      final p = Person._internal(name);
      _cache[name] = p;
      return p;
    }
  }

  Person._internal(this.name);
}
```

## 3.3. setter 和 getter

```dart
class Person {
  String name;

  // setter
  set setName(String name) => this.name = name;
  // set setName(String name) {
  //   this.name = name;
  // }

  // getter
  String get getName => name;
  // String get getName {
  //   return this.name;
  // }
}
```

## 3.4. 类的继承

- 父类中的所有成员变量和方法都会被继承, 但是构造方法除外。
- 子类中可以调用父类的构造方法，对某些属性进行初始化：
  - 子类的构造方法在执行前，将隐含调用父类的 `无参默认构造方法`（没有参数且与类同名的构造方法）。
  - 如果父类没有 `无参默认构造方法`，则子类的构造方法必须在初始化列表中通过 `super` 显式调用父类的某个构造方法。

```dart
class Animal {
  int age;

  Animal(this.age);
}

class Dog extends Animal {
  String name;

  // 要实现父类的构造方法
  // Dog(String name, int age):name = name, super(age);
  Dog(this.name, int age): super(age);
}
```

## 3.4.5 抽象类(接口)的实现

- 通过 implements 实现某个抽象类时，类中所有的方法和成员变量都 必须被重新实现 (无论这个类原来是否已经实现过该方法)。

```dart
abstract class Runner {
  int a = 1;
  run() {
    print('跑');
  }
}

abstract class Flyer {
  fly();
}

class SuperMan implements Runner, Flyer {
  @override
  run() {
    print('超人在奔跑');
  }

  @override
  fly() {
    print('超人在飞');
  }

  @override
  int a = 1;
}
```

## 3.5. 抽象类

什么是 抽象方法? 在 Dart 中没有具体实现的方法(没有方法体)，就是抽象方法。

- 抽象方法，必须存在于抽象类中。
- 抽象类是使用 abstract 声明的类。

```dart
abstract class Shape {
  getArea();
}

class Circle extends Shape {
  double r;

  Circle(this.r);

  @override
  getArea() {
    return r * r * 3.14;
  }
}
```

注意事项:

- **注意一**: 抽象类不能实例化.
- **注意二**: 抽象类中的抽象方法必须被子类实现, 抽象类中的已经被实现的方法, 可以不被子类重写.

## 3.6. 隐式接口

- 定义一个父类 Vehicle

```dart
class Vehicle {
  num speed = 0;

  Vehicle() {
    print("super Constructor") ;
  }

  Vehicle.get() {
    print("super Run") ;
  }

  Vehicle.create() {
    print("super create") ;
  }

  void run() {
    print("vehicle run") ;
  }

  void printSpeed() {
    print("spped = > $spped") ;
  }
}
```

- 定义一个子类实现父类

```dart
class Benz implements Vehicle {
  @override
  void run() {
    print("Benz running");
  }

  @override
  void printspped() {
    print("benz spped = $spped") ;
  }
  
  // 覆盖(实现)成员变量
  @override
  num speed;
}
```

## 3.7. Mixin 混入

在通过 implements 实现某个类时，类中所有的方法都 `必须被重新实现` (无论这个类原来是否已经实现过该方法)。

但是某些情况下，一个类可能希望直接复用之前类的原有实现方案，怎么做呢?

- 使用继承吗？但是 Dart 只支持单继承，那么意味着你只能复用一个类的实现。

Dart 提供了另外一种方案: Mixin 混入的方式

- 除了可以通过 class 定义类之外，也可以通过 `mixin关键字` 来定义一个类。
- 只是通过 mixin 定义的类用于被其他类混入使用，通过 `with关键字` 来进行混入。

```dart
main(List<String> args) {
  var superMan = SuperMan();
  superMan.run();
  superMan.fly();
}

mixin Runner {
  final int a = 1;
  eat();
  run() {
    print('在奔跑');
  }
}

mixin Flyer {
  fly() {
    print('在飞翔');
  }
}

// implements 的方式要求必须对其中的方法进行重新实现
// class SuperMan implements Runner, Flyer {}

class SuperMan implements Runner, Flyer {
  // 重写父类方法
  @override
  run() {
    print('SuperMan在奔跑$a');
    // return super.run();
  }

  @override
  eat() {
    print('SuperMan吃饭');
  }
}
```

## 3.8. 类成员和类方法

在 Dart 中我们使用 static 关键字来定义:

```dart
static String time;
static attendClass() {
    print('去上课');
  }
```

## 3.9. 枚举类型

### 3.9.1. 枚举的定义

```dart
enum Colors {
  red,
  green,
  blue
}
```

### 3.9.2. 枚举的属性

枚举类型中有两个比较常见的属性:

- index: 用于表示每个枚举常量的索引, 从 0 开始.
- values: 包含每个枚举值的 List.

```dart
main(List<String> args) {
  print(Colors.red.index);
  print(Colors.green.index);
  print(Colors.blue.index);

  print(Colors.values);
}
```

枚举类型的注意事项:

- 注意一: 您不能子类化、混合或实现枚举。
- 注意二: 不能显式实例化一个枚举

# 四. 泛型

## 4.1. List 和 Map 的泛型

List 使用时的泛型写法:

```dart
// 创建List的方式
var names1 = ['why', 'kobe', 'james', 111];
print(names1.runtimeType); // List<Object>

// 限制类型
var names2 = <String>['why', 'kobe', 'james', 111]; // 最后一个报错
List<String> names3 = ['why', 'kobe', 'james', 111]; // 最后一个报错
```

Map 使用时的泛型写法:

```dart
// 创建Map的方式
var infos1 = {1: 'one', 'name': 'why', 'age': 18};
print(infos1.runtimeType); // _InternalLinkedHashMap<Object, Object>

// 对类型进行限制
Map<String, String> infos2 = {'name': 'why', 'age': 18}; // 18不能放在value中
var infos3 = <String, String>{'name': 'why', 'age': 18}; // 18不能放在value中
```

## 4.2. 类定义的泛型

如果我们需要定义一个类, 用于存储位置信息 Location, 但是并不确定使用者希望使用的是 int 类型,还是 double 类型, 甚至是一个字符串, 这个时候如何定义呢?

- 一种方案是使用 Object 类型, 但是在之后使用时, 非常不方便
- 另一种方案就是使用泛型.

Location 类的定义: Object 方式

```dart
main(List<String> args) {
  Location l1 = Location(10, 20);
  print(l1.x.runtimeType); // Object
}

class Location {
  Object x;
  Object y;

  Location(this.x, this.y);
}
```

Location 类的定义: 泛型方式

```dart
main(List<String> args) {
  Location l2 = Location<int>(10, 20);
  print(l2.x.runtimeType); // int

  Location l3 = Location<String>('aaa', 'bbb');
  print(l3.x.runtimeType); // String
}

class Location<T> {
  T x;
  T y;

  Location(this.x, this.y);
}
```

如果我们希望类型只能是 num 类型, 怎么做呢?

- 注意: int 和 double 类型都继承 num 类型

```dart
main(List<String> args) {
  Location l2 = Location<int>(10, 20);
  print(l2.x.runtimeType);

  // 错误的写法, 类型必须继承自num
  Location l3 = Location<String>('aaa', 'bbb');
  print(l3.x.runtimeType);
}

class Location<T extends num> {
  T x;
  T y;

  Location(this.x, this.y);
}
```

## 4.3. 泛型方法的定义

最初，Dart 仅仅在类中支持泛型。后来一种称为泛型方法的新语法允许在方法和函数中使用类型参数。

```dart
main(List<String> args) {
  var names = ['why', 'kobe'];
  var first = getFirst(names);
  print('$first ${first.runtimeType}'); // why String
}

T getFirst<T>(List<T> ts) {
  return ts[0];
}
```

# 五. 库的使用

> - 在 Dart 中，你可以导入一个库来使用它所提供的功能。
> - 库的使用可以使代码的重用性得到提高，并且可以更好的组合代码。
> - Dart 中任何一个 dart 文件都是一个库，即使你没有用 `关键字library` 声明

## 5.1. 库的导入

import 语句用来导入一个库，后面跟一个字符串形式的 Uri 来指定表示要引用的库，语法如下：

```dart
import '库所在的uri'
```

**常见的库 URI 有三种不同的形式**

- 来自 dart 标准版，比如 dart:io、dart:html、dart:math、dart:core(但是 core 可以省略, 默认自动导入)

```dart
// dart: 前缀表示Dart的标准库，如dart:io、dart:html、dart:math
import 'dart:io'
```

- 使用相对路径导入的库，通常指自己项目中定义的其他 dart 文件

```dart
//当然，你也可以用相对路径或绝对路径的dart文件来引用
import 'lib/student/student.dart'
```

- Pub 包管理工具管理的一些库，包括自己的配置以及一些第三方的库，通常使用前缀 package

```dart
// Pub包管理系统中有很多功能强大、实用的库，可以使用前缀 package:
import 'package:flutter/material.dart'
```

**库文件中内容的显示和隐藏**
如果希望`只导入库中某些内容`，或者刻意`隐藏库里面某些内容`，可以使用`show`和`hide`关键字

- **show 关键字**: 可以显示某个成员（屏蔽其他）
- **hide 关键字**: 可以隐藏某个成员（显示其他）

```dart
import 'lib/student/student.dart' show Student, Person;
import 'lib/student/student.dart' hide Person;
```

**库中内容和当前文件中的名字冲突**

当各个库有命名冲突的时候，可以使用 `as关键字` 来使用命名空间

```dart
import 'lib/student/student.dart' as Stu;
Stu.Student s = new Stu.Student();
```

## 5.2. 库的定义

**library 关键字**

通常在定义库时，我们可以使用 library 关键字给库起一个名字。

但目前我发现，库的名字并不影响导入，因为 import 语句用的是字符串 URI

```dart
library math;
```

**part 关键字**

在之前我们使用 student.dart 作为演练的时候，只是将该文件作为一个库。

在开发中，如果一个库文件太大，将所有内容保存到一个文件夹是不太合理的，我们有可能希望将这个库进行拆分，这个时候就可以使用 part 关键字了

不过官方已经`不建议使用这种方式`了：

- https://dart.dev/guides/libraries/create-library-packages

`mathUtils.dart`文件

```dart
part of "utils.dart";

int sum(int num1, int num2) {
  return num1 + num2;
}
```

`dateUtils.dart`文件

```dart
part of "utils.dart";

String dateFormat(DateTime date) {
  return "2020-12-12";
}
```

`utils.dart`文件

```dart
part "mathUtils.dart";
part "dateUtils.dart";
```

`test_libary.dart`文件

```dart
import "lib/utils.dart";

main(List<String> args) {
  print(sum(10, 20));
  print(dateFormat(DateTime.now()));
}
```

**export 关键字**

官方`不推荐使用part关键字`，那如果库非常大，如何进行管理呢？

- 将每一个 dart 文件作为库文件，使用`export关键字`在某个库文件中单独导入

`mathUtils.dart`文件

```dart
int sum(int num1, int num2) {
  return num1 + num2;
}
```

`dateUtils.dart`文件

```dart
String dateFormat(DateTime date) {
  return "2020-12-12";
}
```

`utils.dart`文件

```dart
library utils;

export "mathUtils.dart";
export "dateUtils.dart";
```

`test_libary.dart`文件

```dart
import "lib/utils.dart";

main(List<String> args) {
  print(sum(10, 20));
  print(dateFormat(DateTime.now()));
}
```

最后，也可以通过 Pub 管理自己的库自己的库，在项目开发中个人觉得不是非常有必要，所以暂时不讲解这种方式。

**external 和 @patch 关键字**

- external: 将方法的的声明和实现分离
- @Patch: 补丁
