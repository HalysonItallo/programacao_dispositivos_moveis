import 'package:dio/dio.dart';

class HttpService {
  static const baseUrl = "https://api.giphy.com/v1/gifs";

  final Dio dio = Dio(
    BaseOptions(baseUrl: baseUrl),
  );

  Future getData(String data) async {
    try {
      return await dio.get(data);
    } catch (e) {
      throw Exception(e);
    }
  }
}
