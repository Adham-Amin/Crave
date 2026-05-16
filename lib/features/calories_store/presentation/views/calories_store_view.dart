import 'package:crave/core/di/service_locator.dart';
import 'package:crave/features/calories_store/domain/repositories/calories_store_repo.dart';
import 'package:crave/features/calories_store/presentation/cubit/calories_store_cubit.dart';
import 'package:crave/features/calories_store/presentation/widgets/calories_store_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CaloriesStoreView extends StatelessWidget {
  const CaloriesStoreView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          CaloriesStoreCubit(caloriesStoreRepo: getIt<CaloriesStoreRepo>()),
      child: const Scaffold(body: CaloriesStoreViewBody()),
    );
  }
}
