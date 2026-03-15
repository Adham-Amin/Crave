part of 'table_history_cubit.dart';

abstract class TableHistoryState {}

class TableHistoryInitial extends TableHistoryState {}

class TableHistoryLoading extends TableHistoryState {}

class TableHistorySuccess extends TableHistoryState {
  final TableHistoryResponse tableHistoryResponse;

  TableHistorySuccess({required this.tableHistoryResponse});
}

class TableHistoryError extends TableHistoryState {
  final String message;

  TableHistoryError({required this.message});
}
