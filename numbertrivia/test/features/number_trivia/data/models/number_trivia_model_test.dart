import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:numbertrivia/features/number_trivia/data/models/number_trivia_model.dart';
import 'package:numbertrivia/features/number_trivia/domain/entities/number_trivia.dart';
import 'package:numbertrivia/features/number_trivia/domain/repositories/number_trivia_repository.dart';
import 'package:numbertrivia/features/number_trivia/domain/usecases/get_concrete_number_trivia.dart';
import '../../../../fixtures/fixture_reader.dart';

class MockNumberTriviaRepository extends Mock
    implements NumberTriviaRepository {}

void main() {
  final tNumbertriviaModel = NumberTriviaModel(number: 1, text: 'Test Text');

  test('should be a subclass of NumberTrivia entity', () async {
    expect(tNumbertriviaModel, isA<NumberTrivia>());
  });

  group('fromJson', () {
    test('should return a valid model when JSON number is an integer',
        () async {
      // arrange
      final Map<String, dynamic> jsonMap = json.decode(fixture('trivia.json'));
      //act
      final result = NumberTriviaModel.fromJson(jsonMap);
      //assert

      expect(result, tNumbertriviaModel);
    });

    test('should return a valid model when JSON number is an double', () async {
      // arrange
      final Map<String, dynamic> jsonMap =
          json.decode(fixture('trivia_double.json'));
      //act
      final result = NumberTriviaModel.fromJson(jsonMap);
      //assert

      expect(result, tNumbertriviaModel);
    });
  });

  group('toJson', () {
    test('Should return a JSON map containing the proper data', () async {
      final result = tNumbertriviaModel.toJson();
      final expectetMap = {
        "text": "Test Text",
        "number": 1,
      };
      expect(result, expectetMap);
    });
  });
}
