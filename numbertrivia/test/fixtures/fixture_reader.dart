import 'dart:io';

String fixture(String name) =>
    File('/home/joaovitor/number-trivia/numbertrivia/test/fixtures/$name').readAsStringSync();
