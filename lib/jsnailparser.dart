/// A utility class for parsing values from dynamic sources such as Maps.
///
/// This class provides methods for safely extracting values from a source map
/// or other dynamic objects. It includes methods for reading various data types
/// like strings, integers, doubles, booleans, lists, maps, and enumerations.
///
/// Example:
/// ```dart
/// final Map<String, dynamic> data = {
///   'name': 'John',
///   'age': 30,
///   'isStudent': true,
///   'grades': [95, 88, 75],
/// };
///
/// final parser = SnailParser();
///
/// final name = parser.readString(data, 'name'); // 'John'
/// final age = parser.readInt(data, 'age'); // 30
/// final isStudent = parser.readBool(data, 'isStudent'); // true
/// final grades = parser.readList(data, 'grades'); // [95, 88, 75]
/// ```
mixin JSnailParser {
  /// Reads a value from the source, returning it if the source is a map,
  /// or `null` otherwise.
  Object? readValue(source, key) {
    return isMap(source) ? source[key] : null;
  }

  /// Tries to read a string value from the source. If the value is not a
  /// string, it returns `null`.
  String? tryReadString(source, key) {
    var value = readValue(source, key);
    return isString(value) ? value as String : null;
  }

  /// Reads a string value from the source, and if not found, returns the
  /// provided `defaultValue`.
  String readString(source, key, {String defaultValue = ''}) {
    return tryReadString(source, key) ?? defaultValue;
  }

  /// Tries to read an integer value from the source. If the value is not an
  /// integer, it returns `null`.
  int? tryReadInt(source, key) {
    var value = readValue(source, key);
    return isInt(value) ? value as int : null;
  }

  /// Reads an integer value from the source, and if not found, returns the
  /// provided `defaultValue`.
  int readInt(source, key, {int defaultValue = -1}) {
    return tryReadInt(source, key) ?? defaultValue;
  }

  /// Tries to read a double value from the source. If the value is not a
  /// double, it returns `null`.
  double? tryReadDouble(source, key) {
    var value = readValue(source, key);
    return isDouble(value) ? value as double : null;
  }

  /// Reads a double value from the source, and if not found, returns the
  /// provided `defaultValue`.
  double readDouble(source, key, {double defaultValue = -1.0}) {
    return tryReadDouble(source, key) ?? defaultValue;
  }

  /// Tries to read a numeric value from the source. If the value is not a
  /// number, it returns `null`.
  num? tryReadNum(source, key) {
    var value = readValue(source, key);
    return isNum(value) ? value as num : null;
  }

  /// Reads a numeric value from the source, and if not found, returns the
  /// provided `defaultValue`.
  num readNum(source, key, {num defaultValue = -1.0}) {
    return tryReadNum(source, key) ?? defaultValue;
  }

  /// Tries to read a boolean value from the source. If the value is not a
  /// boolean, it returns `null`.
  bool? tryReadBool(source, key) {
    var value = readValue(source, key);
    return isBool(value) ? value as bool : null;
  }

  /// Reads a boolean value from the source, and if not found, returns the
  /// provided `defaultValue`.
  bool readBool(source, key, {bool defaultValue = false}) {
    return tryReadBool(source, key) ?? defaultValue;
  }

  /// Tries to read a list value from the source. If the value is not a list,
  /// it returns `null`.
  List? tryReadList(source, key) {
    var value = readValue(source, key);
    return isList(value) ? value as List : null;
  }

  /// Reads a list value from the source, and if not found, returns an empty list.
  List readList(source, key) {
    return tryReadList(source, key) ?? [];
  }

  /// Tries to read a map value from the source. If the value is not a map,
  /// it returns `null`.
  Map? tryReadMap(source, key) {
    var value = readValue(source, key);
    return isMap(value) ? value as Map : null;
  }

  /// Reads a map value from the source, and if not found, returns an empty map.
  Map readMap(source, key) {
    return tryReadMap(source, key) ?? {};
  }

  /// Tries to read an enumeration value from the source. If the value is a
  /// string that matches one of the provided `values`, it returns the
  /// corresponding enumeration value. If not found or in case of an error,
  /// it returns `null`.
  T? tryReadEnum<T extends Enum>(source, key, List<T> values) {
    try {
      var value = readValue(source, key);
      return value is String ? values.byName(value) : null;
    } catch (ignore) {
      return null;
    }
  }

  /// Reads an enumeration value from the source. If not found or in case of an
  /// error, it returns the provided `defaultValue`.
  T readEnum<T extends Enum>(source, key, List<T> values, T defaultValue) {
    return tryReadEnum<T>(source, key, values) ?? defaultValue;
  }

  /// Checks if the given value is an integer.
  bool isInt(value) {
    return value is int;
  }

  /// Checks if the given value is a double.
  bool isDouble(value) {
    return value is double;
  }

  /// Checks if the given value is a string.
  bool isString(value) {
    return value is String;
  }

  /// Checks if the given value is a numeric value (either int or double).
  bool isNum(value) {
    return value is num;
  }

  /// Checks if the given value is a boolean.
  bool isBool(value) {
    return value is bool;
  }

  /// Checks if the given value is a map.
  bool isMap(value) {
    return value is Map;
  }

  /// Checks if the given value is a list.
  bool isList(value) {
    return value is List;
  }

  /// Checks if the source contains a non-null value for the given key.
  bool hasValue(source, key) {
    return isMap(source) && source[key] != null;
  }

  /// Checks if the source contains the given key.
  bool hasKey(source, key) {
    return isMap(source) && (source as Map).containsKey(key);
  }
}
