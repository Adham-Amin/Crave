import 'package:crave/core/services/api_service.dart';
import 'package:crave/features/auth/data/datasources/auth_data_source.dart';
import 'package:crave/features/auth/data/repositories/auth_repo_impl.dart';
import 'package:crave/features/auth/domain/repositories/auth_repo.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void serverLocator() {
  getIt.registerLazySingleton<ApiService>(() => ApiService(Dio()));

  getIt.registerLazySingleton<AuthDataSource>(
    () => AuthDataSourceImpl(apiService: getIt<ApiService>()),
  );
  getIt.registerLazySingleton<AuthRepo>(
    () => AuthRepoImpl(authDataSource: getIt<AuthDataSource>()),
  );
}
