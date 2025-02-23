import 'package:dartz/dartz.dart';
import 'package:shop_flow/core/errors/failure.dart';
import 'package:shop_flow/features/home/data/models/payment_intent_input_model.dart';

abstract class CheckoutRepo {
  Future<Either<Failure, void>> makePayment(
      {required PaymentIntentInputModel model});
}
