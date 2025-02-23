import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:shop_flow/features/home/data/models/payment_intent_input_model.dart';
import 'package:shop_flow/features/home/data/repositories/checkout_repo_impl.dart';
part 'checkout_state.dart';

class CheckoutCubit extends Cubit<CheckoutState> {
  CheckoutCubit() : super(CheckoutInitial());
  final checkoutRepo = CheckoutRepoImpl();

  Future<void> makePayment({required PaymentIntentInputModel model}) async {
    emit(CheckoutLoading());

    var result = await checkoutRepo.makePayment(model: model);

    result.fold((failed) => emit(CheckoutFailed(message: failed.message)),
        (success) => emit(CheckoutSuccess()));
  }

  @override
  void onChange(Change<CheckoutState> change) {
    log('CheckoutCubit: ${change.currentState}');
    super.onChange(change);
  }
}
