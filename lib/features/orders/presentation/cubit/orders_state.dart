part of 'orders_cubit.dart';

abstract class OrdersState {}

class OrdersInitial extends OrdersState {}

class OrdersLoading extends OrdersState {}

class OrdersError extends OrdersState {
  final String message;
  OrdersError({required this.message});
}

class OrdersSuccess extends OrdersState {
  final List<OrderEntity> orders;
  OrdersSuccess({required this.orders});
}
