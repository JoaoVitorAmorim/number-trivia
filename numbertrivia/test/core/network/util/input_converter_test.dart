import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:numbertrivia/core/util/input_converter.dart';

void main() {
  InputConverter inputConverter;

  setUp(() {
    inputConverter = InputConverter();
  });

  group('stringToUnsignedInt', () {
    test(
        'should return a interger when the string represents an unsigned integer',
        () async {
      //arrange
      final str = '123';
      //action
      final result = inputConverter.stringToUnsignedInteger(str);
      //assert result
      expect(result, Right(123));
    });

    test('should return a Failure when the string in not an  integer',
        () async {
      //arrange
      final str = 'abc';
      //action
      final result = inputConverter.stringToUnsignedInteger(str);
      //assert result
      expect(result, Left(InvalidInputFailure()));
    });

    test('should return a Failure when the string a negative integer',
        () async {
      //arrange
      final str = '-123';
      //action
      final result = inputConverter.stringToUnsignedInteger(str);
      //assert result
      expect(result, Left(InvalidInputFailure()));
    });
  });
}
