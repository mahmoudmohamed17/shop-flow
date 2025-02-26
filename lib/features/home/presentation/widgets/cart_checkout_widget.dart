import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_flow/core/funcs/handle_orders_process.dart';
import 'package:shop_flow/core/widgets/custom_button.dart';
import 'package:shop_flow/features/home/data/models/payment_intent_input_model.dart';
import 'package:shop_flow/features/home/presentation/manager/cart_cubit/cart_cubit.dart';
import 'package:shop_flow/features/home/presentation/manager/checkout_cubit/checkout_cubit.dart';
import 'package:shop_flow/features/home/presentation/widgets/cart_checkout_data.dart';

class CartCheckoutWidget extends StatelessWidget {
  const CartCheckoutWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 12,
      children: [
        CartCheckoutData(),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              BlocBuilder<CheckoutCubit, CheckoutState>(
                builder: (context, state) {
                  return Expanded(
                    child: CustomButton(
                      label: 'Checkout',
                      isLoading: state is CheckoutLoading,
                      onPressed: () async {
                        double amount = context.read<CartCubit>().total + 8.00;
                        var paymentIntentModel = PaymentIntentInputModel(
                            amount: '${amount.round().toString()}00',
                            currency: 'USD',
                            customerId: 'cus_RqOK9KKStz1fzS');
                        await context
                            .read<CheckoutCubit>()
                            .makePayment(model: paymentIntentModel);
                        // ignore: use_build_context_synchronously
                        handleAfterPaymentProcess(context);
                      },
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}
