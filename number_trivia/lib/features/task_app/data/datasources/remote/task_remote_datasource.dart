import 'dart:convert';
import 'package:task_app/core/error/exceptions.dart';
import 'package:http/http.dart' as http;
import 'package:task_app/features/task_app/data/models/task_model.dart';

import 'package:shared_preferences/shared_preferences.dart';

abstract class TaskRemoteDataSource {
  /// Throws a [ServerException] for all error codes.
  Future<TaskModel> addTask(TaskModel task);

  /// Throws a [ServerException] for all error codes.
  Future<List<TaskModel>> getAllTasks();

  /// Throws a [ServerException] for all error codes.
  Future<bool> deleteTask(String id);
}

class TaskRemoteDataSourceImp implements TaskRemoteDataSource {
  final http.Client client;
  final baseUrl = "api-nodejs-todolist.herokuapp.com";
  final SharedPreferences sharedPreferences;

  TaskRemoteDataSourceImp({
    required this.client,
    required this.sharedPreferences,
  });

  @override
  Future<TaskModel> addTask(TaskModel task) async {
    var token = sharedPreferences.get('token');

    final response = await client.post(
      Uri.https(baseUrl, "/task"),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token'
      },
      body: jsonEncode(task),
    );

    if (response.statusCode == 200) {
      final taskQueryResult = json.decode(response.body)["task"];

      return TaskModel.fromJson(taskQueryResult);
    } else {
      throw ServerException();
    }
  }

  @override
  Future<bool> deleteTask(String id) async {
    var token = sharedPreferences.get('token');

    final response = await client.post(
      Uri.https(baseUrl, "/task/$id"),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token'
      },
    );

    if (response.statusCode == 200) {
      final taskQueryResult = json.decode(response.body)["task"];
      print(taskQueryResult);

      return Future.value(true);
    } else {
      throw ServerException();
    }
  }

  @override
  Future<List<TaskModel>> getAllTasks() async {
    var token = sharedPreferences.get('token');

    final response = await client.get(
      Uri.https(baseUrl, "/task"),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token'
      },
    );

    if (response.statusCode == 200) {
      final taskQueryResult = json.decode(response.body)["task"];

      return jsonDecode(taskQueryResult)
          .map(
            (TaskModel task) => TaskModel(
              id: task.id,
              description: task.description,
            ),
          )
          .toList();
    } else {
      throw ServerException();
    }
  }
}
