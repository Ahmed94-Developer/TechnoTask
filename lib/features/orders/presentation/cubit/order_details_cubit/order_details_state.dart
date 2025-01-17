part of 'order_details_cubit.dart';

@immutable
sealed class OrderDetailsState {}

final class OrderDetailsInitial extends OrderDetailsState {}


class OrderDetailsLoadingState extends OrderDetailsState {}

class OrderDetailsErrorState extends OrderDetailsState {
  final String message;

  OrderDetailsErrorState({required this.message});
}
class OrderDetailsSuccessState extends OrderDetailsState {
  final OrderDetailsResponse orderDetailsResponse;

  OrderDetailsSuccessState({required this.orderDetailsResponse});
}
