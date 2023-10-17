# JSnail

![](https://raw.githubusercontent.com/snailapp/main/logo.png)
### A utility class for parsing values from dynamic sources such as Maps.

This package provides methods for safely extracting values from a source map or other dynamic
objects. It includes methods for reading various data types like strings, integers, doubles,
booleans, lists, maps, and enumerations.

```dart
import 'package:flutter/foundation.dart';

import 'jsnail.dart';
import 'jsnailparser.dart';

enum Role { admin, viewer, moderator, user, unknown }

class UserModel1 {
  late String name;
  late int age;
  late bool isStudent;
  late List grades;
  late Role role;

  void parseModel(Map data) {
    JSnail js = const JSnail();
    age = js.readInt(data, 'age'); // 30
    name = js.readString(data, 'name'); // 'John'
    role = js.readEnum(data, 'role', Role.values, Role.unknown); // admin,
    isStudent = js.readBool(data, 'isStudent'); // true
    grades = js.readList(data, 'grades'); // [95, 88]
  }
}

class UserModel2 with JSnailParser {
  late String name;
  late int age;
  late bool isStudent;
  late List grades;
  late Role role;

  void parseModel(Map data) {
    age = readInt(data, 'age'); // 30
    name = readString(data, 'name'); // 'John'
    role = readEnum(data, 'role', Role.values, Role.unknown); // admin,
    isStudent = readBool(data, 'isStudent'); // true
    grades = readList(data, 'grades'); // [95, 88]
  }
}

class JSnailTest {
  void runTest() {
    final data = {
      'age': 30,
      'name': 'John',
      'role': 'admin',
      'isStudent': true,
      'grades': [95, 88, 75],
    };
    UserModel1 userModel = UserModel1()..parseModel(data);
    UserModel2 userMode2 = UserModel2()..parseModel(data);
    debugPrint(
      'age =  ${userModel.age}, '
          'name = ${userModel.name},'
          'role =  ${userModel.role}, '
          'grades =  ${userModel.grades}, '
          'isStudent =  ${userModel.isStudent}',
    );
    debugPrint(
      'age =  ${userMode2.age}, '
          'name = ${userMode2.name},'
          'role =  ${userMode2.role}, '
          'grades =  ${userMode2.grades}, '
          'isStudent =  ${userMode2.isStudent}',
    );
  }
}
```
