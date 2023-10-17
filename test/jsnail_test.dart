import 'package:flutter_test/flutter_test.dart';
import 'package:jsnail/jsnail.dart';

void main() {
  test('adds one to input values', () {
    final source = {
      'age': 30,
      'name': 'John',
      'isStudent': true,
    };
    JSnail jSnail = const JSnail();
    expect(jSnail.tryReadInt(source, 'age'), 30);
    expect(jSnail.readString(source, 'name'), 'John');
    expect(jSnail.readBool(source, 'isStudent'), true);
  });
}
