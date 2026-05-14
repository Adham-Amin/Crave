import 'package:crave/core/di/service_locator.dart';
import 'package:crave/features/table_history/domain/repositories/table_history_repo.dart';
import 'package:crave/features/table_history/presentation/cubit/table_history_cubit.dart';
import 'package:crave/features/table_history/presentation/widgets/tables_history_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TablesHistoryView extends StatelessWidget {
  const TablesHistoryView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          TableHistoryCubit(tableHistoryRepo: getIt<TableHistoryRepo>())
            ..getTableHistory(),
      child: Scaffold(
        appBar: AppBar(),
        body: TablesHistoryViewBody()),
    );
  }
}
