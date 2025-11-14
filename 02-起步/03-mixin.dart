/**
  注意: 
  1. mixin 不能继承类，只能继承其他 mixin
  2. 如果多个mixin 中有同名方法，with 时，会默认使用最后面的 mixin 的

  ```dart
    mixin Walk {
      walk() {
        print('walk');
      }
    }

    mixin Code {
      code() {
        print('key');
      }
    }

    class Dog with Eat, Walk {}
    class Man extends Person with Eat, Walk, Code {}
  ```
 */
