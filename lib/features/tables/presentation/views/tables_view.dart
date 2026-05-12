import 'package:crave/core/di/service_locator.dart';
import 'package:crave/features/tables/domain/repositories/tables_repo.dart';
import 'package:crave/features/tables/presentation/cubit/tables_cubit.dart';
import 'package:crave/features/tables/presentation/widgets/tables_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TablesView extends StatelessWidget {
  const TablesView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TablesCubit(
        tablesRepo: getIt<TablesRepo>(),
      ),
      child: const Scaffold(
        body: TablesViewBody(),
      ),
    );
  }
}