import 'dart:convert';

import 'package:number_trivia/core/error/exceptions.dart';
import 'package:http/http.dart' as http;
import 'package:number_trivia/features/number_trivia/data/models/user_model.dart';

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
  final baseUrl = 'https://api-nodejs-todolist.herokuapp.com/user';

  UserRemoteDataSourceImp({required this.client});

  @override
  Future<UserModel> registerUser(UserModel user) async => _postFromUrl(
        Uri.http(baseUrl, 'register'),
        user.toJson(),
        '',
      );

  @override
  Future<UserModel> login(email, password) => _postFromUrl(
        Uri.http(baseUrl, 'login'),
        {email: email, password: password},
        '',
      );

  @override
  Future<UserModel> logout(String token) =>
      _postFromUrl(Uri.http(baseUrl, 'logout'), {}, token);

  Future<UserModel> _postFromUrl(Uri url, dynamic data, String token) async {
    final response = await client.post(
      url,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
      body: data,
    );

    if (response.statusCode == 200) {
      return UserModel.fromJson(json.decode(response.body));
    } else {
      throw ServerException();
    }
  }

  Future<UserModel> _getFromUrl(Uri url) async {
    final response = await client.get(
      url,
      headers: {
        'Content-Type': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      return UserModel.fromJson(json.decode(response.body));
    } else {
      throw ServerException();
    }
  }
}
