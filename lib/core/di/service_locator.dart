import 'package:crave/core/services/api_service.dart';
import 'package:crave/features/auth/data/datasources/auth_data_source.dart';
import 'package:crave/features/auth/data/repositories/auth_repo_impl.dart';
import 'package:crave/features/auth/domain/repositories/auth_repo.dart';
import 'package:crave/features/calories_store/data/datasources/calories_store_data_source.dart';
import 'package:crave/features/calories_store/data/repositories/calories_store_repo_impl.dart';
import 'package:crave/features/calories_store/domain/repositories/calories_store_repo.dart';
import 'package:crave/features/cart/data/datasources/cart_data_source.dart';
import 'package:crave/features/cart/data/repositories/cart_repo_impl.dart';
import 'package:crave/features/cart/domain/repositories/cart_repo.dart';
import 'package:crave/features/home/data/datasources/home_remote_data_source.dart';
import 'package:crave/features/home/data/repositories/home_repo_impl.dart';
import 'package:crave/features/home/domain/repositories/home_repo.dart';
import 'package:crave/features/orders/data/datasources/order_remote_data_source.dart';
import 'package:crave/features/orders/data/repositories/order_repo_impl.dart';
import 'package:crave/features/orders/domain/repositories/order_repo.dart';
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

  getIt.registerLazySingleton<HomeRemoteDataSource>(
    () => HomeRemoteDataSourceImpl(apiService: getIt<ApiService>()),
  );
  getIt.registerLazySingleton<HomeRepo>(
    () => HomeRepoImpl(homeRemoteDataSource: getIt<HomeRemoteDataSource>()),
  );

  getIt.registerLazySingleton<CartDataSource>(
    () => CartDataSourceImpl(apiService: getIt<ApiService>()),
  );
  getIt.registerLazySingleton<CartRepo>(
    () => CartRepoImpl(cartDataSource: getIt<CartDataSource>()),
  );

  getIt.registerLazySingleton<CaloriesStoreDataSource>(
    () => CaloriesStoreDataSourceImpl(apiService: getIt<ApiService>()),
  );
  getIt.registerLazySingleton<CaloriesStoreRepo>(
    () => CaloriesStoreRepoImpl(
      caloriesStoreDataSource: getIt<CaloriesStoreDataSource>(),
    ),
  );

  getIt.registerLazySingleton<OrderRemoteDataSource>(
    () => OrderRemoteDataSourceImpl(apiService: getIt<ApiService>()),
  );
  getIt.registerLazySingleton<OrderRepo>(
    () => OrderRepoImpl(orderRemoteDataSource: getIt<OrderRemoteDataSource>()),
  );
}
