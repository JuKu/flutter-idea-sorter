import 'dart:io';

/// reads a string from a file in fixtures directory
String fixture(String name) => File('test/fixtures/$name').readAsStringSync();
