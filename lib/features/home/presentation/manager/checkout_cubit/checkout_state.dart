part of 'checkout_cubit.dart';

class CheckoutState {}

final class CheckoutInitial extends CheckoutState {}
final class CheckoutLoading extends CheckoutState {}
final class CheckoutSuccess extends CheckoutState {}
final class CheckoutFailed extends CheckoutState {
  final String message;

  CheckoutFailed({required this.message});
}
