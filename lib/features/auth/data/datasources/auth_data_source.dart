import 'package:crave/core/services/api_service.dart';
import 'package:crave/features/auth/data/models/auth_response.dart';
import 'package:crave/features/auth/data/models/register_request.dart';

abstract class AuthDataSource {
  Future<AuthResponse> login({required String email, required String password});
  Future<AuthResponse> register({required RegisterRequest userInfo});
}

class AuthDataSourceImpl implements AuthDataSource {
  final ApiService _apiService;
  AuthDataSourceImpl({required ApiService apiService})
    : _apiService = apiService;

  @override
  Future<AuthResponse> login({
    required String email,
    required String password,
  }) async {
    var response = await _apiService.post(
      endPoint: '/login',
      data: {'email': email, 'password': password},
    );
    return AuthResponse.fromJson(response['data']);
  }

  @override
  Future<AuthResponse> register({required RegisterRequest userInfo}) async {
    var response = await _apiService.post(
      endPoint: '/register',
      data: userInfo.toJson(),
    );
    return AuthResponse.fromJson(response['data']);
  }
}
