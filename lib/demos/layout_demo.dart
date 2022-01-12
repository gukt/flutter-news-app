import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // return const Example1();
    return const Example3();
  }
}

class Example1 extends StatelessWidget {
  const Example1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Container 是根 Widget，它的父级 Screen 限制了它的高度和宽度必须和屏幕尺寸相同。所以看到的是全屏的红色。
    return Container(
      color: Colors.red,
    );
  }
}

class Example3 extends StatelessWidget {
  const Example3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        // height: 100,
        // width: 100,
        // constraints: BoxConstraints.tight(const Size(100, 100)),
        constraints: const BoxConstraints.tightForFinite(),
        color: Colors.red,
        child: Container(
          height: 1000,
          width: 1000,
          color: Colors.blue,
        ),
      ),
    );
  }
}

class Example2 extends StatelessWidget {
  const Example2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Container 是根 Widget，它的父级 Screen 限制了它的高度和宽度必须和屏幕尺寸相同。所以看到的是全屏的红色。
    return Center(
      child: Container(
          color: Colors.red,
          height: 100,
          width: 100,
          child: UnconstrainedBox(
            child: Container(
              width: 50,
              height: 50,
              color: Colors.blue,
            ),
          )
          // constraints: const BoxConstraints(
          //   maxHeight: 300,
          //   maxWidth: 300,
          // ),
          // child: Container(
          //   color: Colors.blue,
          //   height: 50,
          //   width: 50,
          // ),
          ),
    );
  }
}
