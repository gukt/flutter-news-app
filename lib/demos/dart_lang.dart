main() {
  // const foo1 = Foo(1, 2);
  // var foo2 = const Foo(1, 2);
  // foo2 = const Foo(2, 3);
  // foo1 = foo2;

  // const foo3 = Foo(2, 3);

  // const p = Point(1, 2);
  // print(p);

  // const now = DateTime.now();
  // now = DateTime.now();
}

class Foo {
  final int m;
  final int n;
  // 只要有一个不是 final 的字段，就不能定义常量构造函数
  // var x = 1;

  // 常量构造函数不能有 body
  // 构建 const 实例，必须使用 const 构造函数
  // const 和 final 的区别：

  // 常量构造函数
  const Foo(this.m, this.n);
}

var foo = 1;

/// 打印一段 hello 语句
///
/// * list item 1
/// * list item 2
/// * list item 3
///
/// 使用 [...] 可以指向某个方法，比如：[getAge]。
/// 也可以指向一个类，比如：[String]
/// 指向类中的某个属性 [String.isEmpty]
/// 指向类中的某个方法 []
/// [foo], [bar]
/// Parameters:
/// * [name2]  - 名称
///
///
/// ### Examples:
/// ```dart
/// min(3, 5) == 3
/// ```
///
/// 向指定的名称([name2]) say hello
void sayHello(String name2) {}

/// 获得年龄
getAge() {
  // This is single line comment
  return 100;
}
