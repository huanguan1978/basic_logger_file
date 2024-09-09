/// FileOutputLogger adds file logging to BasicLogger.

library basic_logger_file;

import 'dart:async';
import 'dart:io';
import 'package:path/path.dart' as path;
import 'package:logging/logging.dart';

import 'package:basic_logger/basic_logger.dart';

part 'src/basic_logger_file_base.dart';
// export 'src/basic_logger_file_base.dart';

// TODO: Export any libraries intended for clients of this package.
