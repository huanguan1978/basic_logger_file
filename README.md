<!-- 
This README describes the package. If you publish this package to pub.dev,
this README's contents appear on the landing page for your package.

For information about how to write a good package README, see the guide for
[writing package pages](https://dart.dev/guides/libraries/writing-package-pages). 

For general information about developing packages, see the Dart guide for
[creating packages](https://dart.dev/guides/libraries/create-library-packages)
and the Flutter guide for
[developing packages and plugins](https://flutter.dev/developing-packages). 
-->

BasicLogger is a fast, extensible, simple and lightweight logging tool for Dart and Flutter.

## Features

FileOutputLogger adds file logging to BasicLogger for Android, iOS, Linux, macOS, and Windows.

## Getting started

```shell
  dart pub add basic_logger_file
```
```shell
  flutter pub add basic_logger_file
```

## Usage

Include short and useful examples for package users. Add longer examples to `/example` folder. 

```dart
  Logger.root.level = Level.ALL;
  final basicLogger = BasicLogger('main');

  // attach file log, bufferSize default 10
  basicLogger.attachLogger(FileOutputLogger(basicLogger.name));

  // output to all attach instance
  basicLogger.info('hello world');
  
  // output buffer to all attach instance, not include detach instance
  basicLogger.output();

  // output
  // 2024-10-15 03:03:21.114721 [INFO] main: hello world
```


## Additional information

- FileOutputLogger, specify output file path

```dart
    var logPath = './logs/';
    /*
    // In Flutter, use the path_provider, get the current application's documents directory.
    final appDocDir = await getApplicationDocumentsDirectory();
    logPath = '${appDocDir.path}/logs/';
    */
    if(!Directory(logPath).existsSync()){
        Directory(logPath).createSync(recursive: true);
    }
    basicLogger.attachLogger(FileOutputLogger(
        basicLogger.name,
        dir: './logs/',
    ));
```

- FileOutputLogger, specify output buffer size

```dart
  // buffering allows you to write files multiple times instead of writing files once
  basicLogger.attachLogger(FileOutputLogger(
    basicLogger.name,
    bufferSize: 100,
  ));

  // output and clear buffer
  basicLogger.output();
```