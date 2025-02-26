// we have three main steps to implement the basic payment operations
// 1. create the payment intent model (amount, currency ==> are required)
// 2. init payment sheet (paymentIntentModel ==> basically takes a secretKey)
// 3. display the payment sheet to the user
// note: it's good to make a method that combines all the three methods
// note: the user's cards info is not saved in this case, which means it requires
// him to add the data every time he deals with the sheet, in this case we need
// to make an account for the user to save his payment's info. which called [Customer] object,
// then the payment intent must be linked to the customer

// more explaination for the last few lines:
// If I have a payment intent, so when I display the payment sheet it takes my paymentIntentClientSecret
// which means that the payment process is linked to me [the person who make the payment intent],
// and Stripe can use this info in a later process, but to approach this we need to fetch the user's info
// which this could be done using the Customer's Ephemeral Key

// note: we have to create an ephemeral key each time the customer make payment process, which
// help getting the customer's saved info like cards as we mentioned above

import 'package:dio/dio.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:shop_flow/core/funcs/get_it_service.dart';
import 'package:shop_flow/core/services/api_service.dart';
import 'package:shop_flow/core/utils/api_keys.dart';
import 'package:shop_flow/features/home/data/models/ephemeral_key_model/ephemeral_key_model.dart';
import 'package:shop_flow/features/home/data/models/init_payment_sheet_input_model.dart';
import 'package:shop_flow/features/home/data/models/payment_intent_input_model.dart';
import 'package:shop_flow/features/home/data/models/payment_intent_model/payment_intent_model.dart';

class StripeService {
  final _apiService = getIt<ApiService>();
  final paymentIntentUrl = 'https://api.stripe.com/v1/payment_intents';
  final customerCreationUrl = 'https://api.stripe.com/v1/customers';
  final ephemeralKeyCreationUrl = 'https://api.stripe.com/v1/ephemeral_keys';

  // step 1
  Future<PaymentIntentModel> createPaymentIntent(
      PaymentIntentInputModel model) async {
    var response = await _apiService.post(
        url: paymentIntentUrl,
        body: model.toJson(),
        token: ApiKeys.stripeSecretKey,
        contentType: Headers.formUrlEncodedContentType);
    var paymentIntentModel = PaymentIntentModel.fromJson(
        response.data); // parsing the data from response
    return paymentIntentModel;
  }

  // step 2
  Future<void> initPaymentSheet(
      {required InitPaymentSheetInputModel model}) async {
    await Stripe.instance.initPaymentSheet(
        paymentSheetParameters: SetupPaymentSheetParameters(
      paymentIntentClientSecret: model.clientSecret,
      customerEphemeralKeySecret: model.ephemeralKey,
      customerId: 'cus_RqOK9KKStz1fzS', // don't forget
      merchantDisplayName: 'Shop Flow', // The organization name
    ));
  }

  // step 3
  Future<void> displayPaymentSheet() async {
    await Stripe.instance.presentPaymentSheet();
  }

  // trigger this to excute the three main steps
  Future<void> makePayment({required PaymentIntentInputModel model}) async {
    var paymentIntentModel = await createPaymentIntent(model);
    var ephemeralKeyModel =
        await createEphemeralKey(customerId: model.customerId);
    var initPaymentSheetInputModel = InitPaymentSheetInputModel(
        clientSecret: paymentIntentModel.clientSecret ?? '',
        customerId: model.customerId,
        ephemeralKey: ephemeralKeyModel.secret!);
    await initPaymentSheet(model: initPaymentSheetInputModel);
    await displayPaymentSheet();
  }

  // called each time a user want to make a payment process
  Future<EphemeralKeyModel> createEphemeralKey(
      {required String customerId}) async {
    var response = await _apiService.post(
        url: ephemeralKeyCreationUrl,
        body: {
          'customer': customerId,
        },
        headers: {
          'Authorization': 'Bearer ${ApiKeys.stripeSecretKey}',
          'Stripe-Version': '2025-01-27.acacia',
        },
        token: ApiKeys.stripeSecretKey,
        contentType: Headers.formUrlEncodedContentType);
    var ephemeralKeyModel = EphemeralKeyModel.fromJson(
        response.data); // parsing the data from response
    return ephemeralKeyModel;
  }
}
