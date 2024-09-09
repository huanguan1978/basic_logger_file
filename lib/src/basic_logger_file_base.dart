part of '../basic_logger_file.dart';

/// output to file, use io
final class FileOutputLogger extends OutputLogger {
  final List<LogRecord> _buffer = [];
  int _bufferSize = 10;
  String _logfile = '';

  FileOutputLogger({
    required String parentName,
    String name = 'basicFileLogger',
    String dir = '.',
    int bufferSize = 2,
  }) : super(parentName, name) {
    _bufferSize = bufferSize;
    _logfile = path.join(
        dir, '${DateTime.now().toLocal().toString().substring(0, 10)}.log');

    name = '$parentName.$name';
    Logger(name).onRecord.listen((LogRecord record) {
      _buffer.add(record);

      if (_buffer.length >= _bufferSize) {
        output();
      }
    });
  }

  @override
  void output() {
    final bufs = <String>[];
    for (LogRecord log in _buffer) {
      bufs.add(
          '${log.time}: [${log.level}] [${log.loggerName}] ${log.message} ${Platform.lineTerminator}');
    }
    unawaited(
      File(_logfile).writeAsString(
        bufs.join(),
        mode: FileMode.writeOnlyAppend,
      ),
    );
    bufs.clear();
    _buffer.clear();
  }
}
