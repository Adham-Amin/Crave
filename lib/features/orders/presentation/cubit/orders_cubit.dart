import 'package:crave/features/orders/domain/entities/order_entity.dart';
import 'package:crave/features/orders/domain/repositories/order_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'orders_state.dart';

class OrdersCubit extends Cubit<OrdersState> {
  OrdersCubit({required this.orderRepo}) : super(OrdersInitial());

  final OrderRepo orderRepo;

  Future<void> getOrdersHistory() async {
    emit(OrdersLoading());
    var result = await orderRepo.getOrdersHistory();
    result.fold(
      (l) => emit(OrdersError(message: l.message)),
      (r) => emit(OrdersSuccess(orders: r)),
    );
  }
}
