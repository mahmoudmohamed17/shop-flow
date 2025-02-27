import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:shop_flow/core/funcs/check_initial_route.dart';
import 'package:shop_flow/core/funcs/get_it_service.dart';
import 'package:shop_flow/core/funcs/on_generated_route.dart';
import 'package:shop_flow/core/services/firebase_api.dart';
import 'package:shop_flow/core/services/shared_prefs.dart';
import 'package:shop_flow/core/utils/api_keys.dart';
import 'package:shop_flow/custom_bloc_observer.dart';
import 'package:shop_flow/features/home/presentation/manager/cart_cubit/cart_cubit.dart';
import 'package:shop_flow/features/home/presentation/manager/checkout_cubit/checkout_cubit.dart';
import 'package:shop_flow/features/home/presentation/manager/favorites_cubit/favorites_cubit.dart';
import 'package:shop_flow/features/home/presentation/manager/notifications_cubit/notifications_cubit.dart';
import 'package:shop_flow/features/orders/presentation/manager/cubit/orders_cubit.dart';
import 'package:shop_flow/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = CustomBlocObserver();
  getItService();
  Stripe.publishableKey = ApiKeys.stripePublishableKey;
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await Future.wait([
    SharedPrefs.init(),
    FirebaseApi().initNotifications(),
  ]);
  runApp(const ShopFlow());
}

class ShopFlow extends StatelessWidget {
  const ShopFlow({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => CartCubit()),
        BlocProvider(create: (context) => FavoritesCubit()),
        BlocProvider(create: (context) => OrdersCubit()),
        BlocProvider(create: (context) => NotificationsCubit()),
        BlocProvider(create: (context) => CheckoutCubit()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        onGenerateRoute: onGeneratedRoute,
        initialRoute: checkInitialRoute(),
      ),
    );
  }
}
