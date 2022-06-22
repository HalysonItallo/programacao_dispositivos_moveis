import 'dart:convert';

import 'package:number_trivia/core/error/exceptions.dart';
import 'package:http/http.dart' as http;
import 'package:number_trivia/features/number_trivia/data/models/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class UserRemoteDataSource {
  /// Throws a [ServerException] for all error codes.
  Future<UserModel> registerUser(UserModel user);

  /// Throws a [ServerException] for all error codes.
  Future<UserModel> login(String email, String password);

  /// Throws a [ServerException] for all error codes.
  Future<UserModel> logout(String token);
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
  Future<UserModel> logout(String token) {
    throw UnimplementedError();
  }

  // Future<UserModel> _getFromUrl(Uri url) async {
  //   final response = await client.get(
  //     url,
  //     headers: {
  //       'Content-Type': 'application/json',
  //     },
  //   );

  //   if (response.statusCode == 200) {
  //     return UserModel.fromJson(json.decode(response.body));
  //   } else {
  //     throw ServerException();
  //   }
  // }
}
