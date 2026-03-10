import 'package:crave/core/services/shared_preferences_service.dart';
import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class ApiService {
  final Dio _dio;
  final String baseUrl = 'https://crave-back.onrender.com/api';

  ApiService(this._dio) {
    addInterceptors();
  }

  void addInterceptors() {
    _dio.interceptors.add(
      PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        responseHeader: false,
        error: true,
        compact: true,
        maxWidth: 90,
      ),
    );

    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          if (options.path.contains('api.stripe.com')) {
            return handler.next(options);
          }

          options.headers['Content-Type'] ??= 'application/json';
          options.headers['Accept'] ??= 'application/json';

          final token = await Prefs.getToken();
          if (token != null && token.isNotEmpty) {
            options.headers['Authorization'] ??= 'Bearer $token';
          }

          return handler.next(options);
        },
      ),
    );
  }

  Future<dynamic> get({required String endPoint, Options? options}) async {
    final Response response = await _dio.get(
      '$baseUrl$endPoint',
      options: options,
    );
    return response.data;
  }

  Future<Map<String, dynamic>> post({
    String? baseUrl,
    required String endPoint,
    Options? options,
    dynamic data,
  }) async {
    final String finalBaseUrl = baseUrl ?? this.baseUrl;

    final Response response = await _dio.post(
      '$finalBaseUrl$endPoint',
      data: data,
      options: options,
    );
    return response.data;
  }

  Future<Map<String, dynamic>> put({
    required String endPoint,
    Map<String, dynamic>? data,
  }) async {
    final Response response = await _dio.put('$baseUrl$endPoint', data: data);
    return response.data;
  }

  Future<Map<String, dynamic>> delete({required String endPoint}) async {
    final Response response = await _dio.delete('$baseUrl$endPoint');
    return response.data;
  }
}
