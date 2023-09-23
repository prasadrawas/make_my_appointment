import 'package:dio/dio.dart';

class ApiClient {
  late Dio _dio;

  ApiClient({String baseUrl = "https://api.example.com"}) {
    _dio = Dio(BaseOptions(baseUrl: baseUrl));

    // Add interceptors
    _dio.interceptors.add(LogInterceptor(
      responseBody: true,
      request: true,
    )); // Logging interceptor
  }

  Future<Response> get(String endpoint,
      {Map<String, dynamic>? queryParameters}) async {
    try {
      final response =
          await _dio.get(endpoint, queryParameters: queryParameters);
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<Response> post(String endpoint, {Map<String, dynamic>? data}) async {
    try {
      final response = await _dio.post(endpoint, data: data);
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
