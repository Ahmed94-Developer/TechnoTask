part of 'orders_cubit.dart';

@immutable
sealed class OrdersState {}

final class OrdersInitial extends OrdersState {}

class UpdateTabOrderState extends OrdersState {}

class ScheduledOrdersLoadingState extends OrdersState {}

class ScheduledOrdersErrorState extends OrdersState {
  final String message;

  ScheduledOrdersErrorState({required this.message});
}

class ScheduledOrdersSuccessState extends OrdersState {
  final OrdersResponse ordersResponse;

  ScheduledOrdersSuccessState({required this.ordersResponse});
}

class InProgressOrdersLoadingState extends OrdersState {}

class InProgressOrdersErrorState extends OrdersState {
  final String message;

  InProgressOrdersErrorState({required this.message});
}

class InProgressOrdersSuccessState extends OrdersState {
  final OrdersResponse ordersResponse;

  InProgressOrdersSuccessState({required this.ordersResponse});
}

class CompletedOrderLoadingState extends OrdersState {}

class CompletedOrderErrorState extends OrdersState {
  final String message;

  CompletedOrderErrorState({required this.message});
}

class CompletedOrdersSuccessState extends OrdersState {
  final OrdersResponse ordersResponse;

  CompletedOrdersSuccessState({required this.ordersResponse});
}

