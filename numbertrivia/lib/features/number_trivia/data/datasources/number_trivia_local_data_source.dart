import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:meta/meta.dart';
import '../../../../core/error/exceptions.dart';
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
  Future<void> cacheNumberTrivia(NumberTriviaModel triviaToCache);
}

const CACHED_NUMBER_TRIVIA = 'CACHED_NUMBER_TRIVIA';

class NumberTriviaLocalDataSourceImpl implements NumberTriviaLocalDataSource {
  final SharedPreferences sharedPreferences;

  NumberTriviaLocalDataSourceImpl({@required this.sharedPreferences});

  @override
  Future<NumberTriviaModel> getLastNumberTrivia() {
    final jsonString = sharedPreferences.getString(CACHED_NUMBER_TRIVIA);
    if (jsonString != null) {
      return Future.value(NumberTriviaModel.fromJson(json.decode(jsonString)));
    } else {
      throw CacheException();
    }
  }

  @override
  Future<void> cacheNumberTrivia(NumberTriviaModel triviaToCache) {
    return sharedPreferences.setString(
      CACHED_NUMBER_TRIVIA,
      json.encode(triviaToCache.toJson()),
    );
  }
}
