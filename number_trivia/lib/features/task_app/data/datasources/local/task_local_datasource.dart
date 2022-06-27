import 'dart:convert';
import 'package:task_app/core/error/exceptions.dart';
import 'package:task_app/features/task_app/data/models/task_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class TaskLocalDataSource {
  /// Gets the cached [TaskModel] which was gotten the last time
  /// the user had an internet connection.
  ///
  /// Throws [CacheException] if no cached data is present.
  Future<List<TaskModel>> getLastTasks();

  Future<void> cacheTask(TaskModel task);
}

const cachedTask = 'CACHED_TASK';

class TaskLocalDataSourceImpl implements TaskLocalDataSource {
  final SharedPreferences sharedPreferences;

  TaskLocalDataSourceImpl({required this.sharedPreferences});

  @override
  Future<List<TaskModel>> getLastTasks() {
    final jsonString = sharedPreferences.getString(cachedTask);
    if (jsonString != null) {
      return Future.value(
        json
            .decode(jsonString)
            .map(
              (task) => TaskModel.fromJson(task),
            )
            .toList(),
      );
    } else {
      throw CacheException();
    }
  }

  @override
  Future<void> cacheTask(TaskModel taskToCache) {
    return sharedPreferences.setString(
      cachedTask,
      json.encode(
        taskToCache.toJson(),
      ),
    );
  }
}
