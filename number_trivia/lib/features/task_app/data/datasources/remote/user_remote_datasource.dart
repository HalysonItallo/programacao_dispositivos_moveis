import 'dart:convert';
import 'package:task_app/core/error/exceptions.dart';
import 'package:http/http.dart' as http;
import 'package:task_app/features/task_app/data/models/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class UserRemoteDataSource {
  /// Throws a [ServerException] for all error codes.
  Future<UserModel> registerUser(UserModel user);

  /// Throws a [ServerException] for all error codes.
  Future<UserModel> login(String email, String password);

  /// Throws a [ServerException] for all error codes.
  Future<void> logout();
}

class UserRemoteDataSourceImp implements UserRemoteDataSource {
  final http.Client client;
  final baseUrl = "api-nodejs-todolist.herokuapp.com";
  final SharedPreferences sharedPreferences;

  UserRemoteDataSourceImp({
    required this.client,
    required this.sharedPreferences,
  });

  @override
  Future<UserModel> registerUser(UserModel user) async {
    final response = await client.post(
      Uri.https(baseUrl, "/user/register"),
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode(user),
    );

    if (response.statusCode == 200) {
      final userQueryResult = json.decode(response.body)["user"];

      return UserModel.fromJson(userQueryResult);
    } else {
      throw ServerException();
    }
  }

  @override
  Future<UserModel> login(email, password) async {
    final response = await client.post(
      Uri.https(baseUrl, "/user/login"),
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode(
        {
          "email": email,
          "password": password,
        },
      ),
    );

    if (response.statusCode == 200) {
      final userQueryResult = json.decode(response.body)["user"];
      final token = json.decode(response.body)["token"];

      await sharedPreferences.setString("token", token);

      return UserModel.fromJson(userQueryResult);
    } else {
      throw ServerException();
    }
  }

  @override
  Future<void> logout() async {
    var token = sharedPreferences.get('token');

    final response = await client.post(
      Uri.https(baseUrl, "/user/logout"),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token'
      },
    );

    if (response.statusCode == 200) {
      sharedPreferences.remove('token');
    } else {
      throw ServerException();
    }
  }
}
