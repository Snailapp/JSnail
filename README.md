A utility class for parsing values from dynamic sources such as Maps.

This package provides methods for safely extracting values from a source map or other dynamic
objects. It includes methods for reading various data types like strings, integers, doubles,
booleans, lists, maps, and enumerations.

Example:

```dart

final Map<String, dynamic> data = {
  'name': 'John',
  'age': 30,
  'isStudent': true,
  'grades': [95, 88, 75],
};
final parser = SnailParser();

final name = parser.readString(data, 'name'); // 'John'
final age = parser.readInt(data, 'age'); // 30
final isStudent = parser.readBool(data, 'isStudent'); // true
final grades = parser.readList(data, 'grades'); // [95, 88, 75]
```