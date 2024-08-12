import 'package:dio/dio.dart';
import 'package:travanix/constant.dart';

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

  static Future<Map<String, dynamic>> get({required String endPoint,Map<String,dynamic>? parameters}) async {
    _dio.options.headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization':
          'Bearer $taken'
    };
    var response = await _dio.get('$_baseUrl$endPoint',queryParameters: parameters);
    return response.data;
  }

  static Future<Map<String, dynamic>> post(
      {required String endPoint, required Map<String, dynamic> data}) async {
    _dio.options.headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization':
          'Bearer $taken'
    };
    var response = await _dio.post(
      '$_baseUrl$endPoint',
      data: data,
    );
    return response.data;
  }

  static Future<Map<String, dynamic>> delete(
      {required endPoint, required String headers}) async {
    _dio.options.headers = {
      'Authorization':
          'Bearer $taken',
      's': headers
    };
    var response = await _dio.delete(
      '$_baseUrl$endPoint',
    );
    return response.data;
  }
}
