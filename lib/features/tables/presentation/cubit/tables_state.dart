part of 'tables_cubit.dart';

abstract class TablesState {}

class TablesInitial extends TablesState {}

class TablesLoading extends TablesState {}

class TablesLoaded extends TablesState {}

class TablesError extends TablesState {
  final String message;
  TablesError({required this.message});
}
