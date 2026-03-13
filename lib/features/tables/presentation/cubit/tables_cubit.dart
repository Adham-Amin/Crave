import 'package:crave/features/tables/data/models/tables_request.dart';
import 'package:crave/features/tables/domain/repositories/tables_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'tables_state.dart';

class TablesCubit extends Cubit<TablesState> {
  TablesCubit({required this.tablesRepo}) : super(TablesInitial());

  final TablesRepo tablesRepo;

  Future<void> storeTable({required TablesRequest table}) async {
    emit(TablesLoading());
    final result = await tablesRepo.storeTable(table: table);
    result.fold(
      (l) => emit(TablesError(message: l.message)),
      (r) => emit(TablesLoaded()),
    );
  }
}
