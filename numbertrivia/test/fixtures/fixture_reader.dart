import 'dart:io';

String fixture(String name) =>
    File('numbertrivia/test/fixtures/$name').readAsStringSync();
