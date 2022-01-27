import '../models/number_trivia_model.dart';

abstract class NumberTriviaLocalDataSource {
  /// Calls the cached which was gotten the last time 
  /// the user had an internet connection.
  ///
  /// Throws a [cacheException] if no cached data is available.
  Future<NumberTriviaModel> getLastNumberTrivia();

  /// Calls the cached which was gotten the last time 
  /// the user had an internet connection.
  ///
  /// Throws a [cacheException] if no cached data is available.
  Future<void> cacheNumberTrivia(NumberTriviaModel triviatoCache);
}
