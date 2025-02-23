import 'package:dartz/dartz.dart';
import 'package:shop_flow/core/errors/api_server_failure.dart';
import 'package:shop_flow/core/errors/failure.dart';
import 'package:shop_flow/core/services/stripe_service.dart';
import 'package:shop_flow/features/home/data/models/payment_intent_input_model.dart';
import 'package:shop_flow/features/home/domain/repositories/checkout_repo.dart';

class CheckoutRepoImpl extends CheckoutRepo {
  final _stripeService = StripeService();
  @override
  Future<Either<Failure, void>> makePayment(
      {required PaymentIntentInputModel model}) async {
    try {
      await _stripeService.makePayment(model: model);
      return right(null);
    } catch (e) {
      return left(ApiServerFailure(message: e.toString()));
    }
  }
}
