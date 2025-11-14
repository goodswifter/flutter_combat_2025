void main(List<String> args) {
  var s1 = 'Hello World'; // Hello World
  var s2 = "Hello Dart"; // Hello Dart
  var s3 = 'Hello\'Fullter'; // Hello'Fullter
  var s4 = "Hello'Fullter"; // Hello'Fullter
  print(s1);
  print(s2);
  print(s3);
  print(s4);

  var letters = ['a', 'b', 'c', 'd'];
  letters.remove('a');
  print(letters);
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

  @override
  int get a => 1;

  @override
  fly() => print('SuperMan在飞翔');
}
