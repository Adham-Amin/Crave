import 'package:crave/core/services/api_service.dart';
import 'package:crave/features/home/data/models/meal_response.dart';

abstract class HomeRemoteDataSource {
  Future<List<MealResponse>> getMealsByCategory({required String category});
  Future<List<MealResponse>> getCombinedMeals();
}

class HomeRemoteDataSourceImpl implements HomeRemoteDataSource {
  final ApiService _apiService;
  HomeRemoteDataSourceImpl({required ApiService apiService})
    : _apiService = apiService;

  @override
  Future<List<MealResponse>> getCombinedMeals() async {
    var response = await _apiService.get(endPoint: '/products/lunch');
    return (response['data'] as List)
        .map((e) => MealResponse.fromJson(e))
        .toList();
  }

  @override
  Future<List<MealResponse>> getMealsByCategory({
    required String category,
  }) async {
    var response = await _apiService.get(endPoint: '/products/$category');
    return (response['data'] as List)
        .map((e) => MealResponse.fromJson(e))
        .toList();
  }
}
