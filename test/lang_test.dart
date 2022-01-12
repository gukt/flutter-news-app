import 'package:flutter_test/flutter_test.dart';

main() {
  test('Dart lang test', () {
    // 使用一个可选的异常描述创建一个异常
    throw const FormatException('At least 6 digits');

    //
    // throw 'This is a plain text exception description';

    // 因为抛出异常是一个表达式， 所以可以在 => 语句中使用，也可以在其他使用表达式的地方抛出异常：
  });
}
