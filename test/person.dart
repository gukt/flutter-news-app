import 'package:flutter/foundation.dart';

const String packageName = 'test';

class Person {
  String name;
  int age;
  late List<String> books = getBooks();

  List<String> getBooks() {
    debugPrint('Get books...');
    return List.empty();
  }

  Person.of(this.name, this.age);
  Person.copyFrom(Person user)
      : name = user.name,
        age = user.age;
}
