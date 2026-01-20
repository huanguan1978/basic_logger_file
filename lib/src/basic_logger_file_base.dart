part of '../basic_logger_file.dart';

/// output to file, use io
final class FileOutputLogger extends OutputLogger {
  final List<LogRecord> _buffer = [];
  int _bufferSize = 10;
  String _dir = '';
  String _ext = '';
  late final String __logName;

  FileOutputLogger(
    String parentName, {
    String selfname = 'file',
    bool selfonly = false,
    String dir = '.',
    String ext = '.log',
    int bufferSize = 100,
  }) : super(parentName, selfname: selfname, listening: false) {
    _bufferSize = bufferSize;
    _dir = dir;
    _ext = ext;

    __logName = '$parentName.$selfname';
    Logger(parentName).onRecord.listen((LogRecord logRec) {
      if (selfonly) {
        if (__logName == logRec.loggerName) _buffer.add(logRec);
      } else {
        if (parentName == logRec.loggerName) _buffer.add(logRec);
      }

      if (_buffer.length >= _bufferSize) output();
    });
  }

  @override
  String Function(LogRecord logRec) get format =>
      (logRec) => '${logRec.time} $logRec \n';

  @override
  String get name => __logName;

  /// output LogRecord form buffer
  @override
  void output([LogRecord? record]) {
    if (_buffer.isEmpty) return;
    final bufs = <String>[];
    for (LogRecord log in _buffer) {
      bufs.add(format(log));
    }
    final logfile = path.join(
        _dir, '${DateTime.now().toLocal().toString().substring(0, 10)}$_ext');
    return unawaited(File(logfile)
        .writeAsString(bufs.join(), mode: FileMode.writeOnlyAppend)
        .whenComplete(() {
      _buffer.clear();
      bufs.clear();
    }));
  }
}
