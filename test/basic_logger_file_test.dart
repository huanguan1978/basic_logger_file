import 'package:basic_logger_file/basic_logger_file.dart';
import 'package:basic_logger/basic_logger.dart' hide FileOutputLogger;

import 'package:test/test.dart';

void main() {
  group('A group of tests', () {
    final named = 'main';
    final basicLogger = BasicLogger('main');

    final namedFileLogger = '$named.basicFileLogger';
    final fileOutputLogger = FileOutputLogger(parentName: basicLogger.name);
    // ignore: unused_local_variable
    final fileLogger = basicLogger.attachLogger(fileOutputLogger);

    setUp(() {
      // Additional setup goes here.
    });

    test('basicLogger singleton', () {
      expect(basicLogger.name, equals(named));
    });
    test('basicLogger, FileOutputLogger, exists', () {
      expect(fileOutputLogger.name, equals(namedFileLogger));
    });
  });
}
