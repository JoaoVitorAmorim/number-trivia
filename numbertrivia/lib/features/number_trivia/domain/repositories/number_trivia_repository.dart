import 'package:dartz/dartz.dart';
import 'package:numbertrivia/core/failures.dart';
import '../entities/number_trivia.dart';

abstract class NumberTriviaRepository {
  Future<Either<Failure, NumberTrivia>> getConcreteNumberTrivia(int number);
  Future<Either<Failure, NumberTrivia>> getRandomNumbertrivia();
}
