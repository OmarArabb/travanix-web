import 'package:dio/dio.dart';

class ApiService {
  static const String _baseUrl = 'http://127.0.0.1:8000/api/Admin/';

  static late Dio _dio;

  static init() {
    _dio = Dio(
      BaseOptions(
        baseUrl: _baseUrl,
        receiveDataWhenStatusError: true,
      ),
    );
  }

  Future<Map<String, dynamic>> get({required String endPoint}) async {
    var response = await _dio.get('$_baseUrl$endPoint');
    return response.data;
  }

  static Future<Map<String, dynamic>> post(
      {required String endPoint, required Map<String, dynamic> data}) async {
    _dio.options.headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    };
    var response = await _dio.post(
      '$_baseUrl$endPoint',
      data: data,
    );
    return response.data;
  }
}
