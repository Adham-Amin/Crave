import 'package:crave/features/table_history/data/models/table_history_response/table_history_response.dart';
import 'package:crave/features/table_history/domain/repositories/table_history_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'table_history_state.dart';

class TableHistoryCubit extends Cubit<TableHistoryState> {
  TableHistoryCubit({required this.tableHistoryRepo})
    : super(TableHistoryInitial());

  final TableHistoryRepo tableHistoryRepo;

  Future<void> getTableHistory() async {
    emit(TableHistoryLoading());
    final response = await tableHistoryRepo.getTableHistory();
    response.fold(
      (failure) => emit(TableHistoryError(message: failure.message)),
      (tableHistory) =>
          emit(TableHistorySuccess(tableHistoryResponse: tableHistory)),
    );
  }
}
