import 'dart:convert';

import 'package:task_app/core/error/exceptions.dart';
import 'package:task_app/features/task_app/data/models/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class UserLocalDataSource {
  /// Gets the cached [UserModel] which was gotten the last time
  /// the user had an internet connection.
  ///
  /// Throws [CacheException] if no cached data is present.
  Future<UserModel> getLastUser();

  Future<void> cacheUser(UserModel triviaToCache);
}

const cachedUser = 'CACHED_USER';

class UserLocalDataSourceImpl implements UserLocalDataSource {
  final SharedPreferences sharedPreferences;

  UserLocalDataSourceImpl({required this.sharedPreferences});

  @override
  Future<UserModel> getLastUser() {
    final jsonString = sharedPreferences.getString(cachedUser);
    if (jsonString != null) {
      return Future.value(
        UserModel.fromJson(
          json.decode(jsonString),
        ),
      );
    } else {
      throw CacheException();
    }
  }

  @override
  Future<void> cacheUser(UserModel userToCache) {
    return sharedPreferences.setString(
      cachedUser,
      json.encode(
        userToCache.toJson(),
      ),
    );
  }
}
