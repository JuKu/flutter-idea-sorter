import 'package:logger/logger.dart';

/// see also: https://flutter.de/artikel/logging-mit-flutter.html
Logger getLogger() {
  return Logger(
    printer: PrettyPrinter(
      lineLength: 120, //90,
      colors: true,
      methodCount: 1,
      errorMethodCount: 5,
    ),
  );
}
