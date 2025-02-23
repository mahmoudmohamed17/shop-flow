import 'package:flutter/material.dart';
import 'package:shop_flow/features/auth/presentation/views/signin_view.dart';
import 'package:shop_flow/features/auth/presentation/views/signup_view.dart';
import 'package:shop_flow/features/home/data/models/category_model.dart';
import 'package:shop_flow/features/home/data/models/top_selling_new_in_model.dart';
import 'package:shop_flow/features/home/domain/entities/product_entity.dart';
import 'package:shop_flow/features/home/presentation/views/cart_view.dart';
import 'package:shop_flow/features/home/presentation/views/categories_search_view.dart';
import 'package:shop_flow/features/home/presentation/views/category_details_view.dart';
import 'package:shop_flow/features/home/presentation/views/checkout_view.dart';
import 'package:shop_flow/features/home/presentation/views/product_details_view.dart';
import 'package:shop_flow/features/home/presentation/views/top_selling_and_new_in_details_view.dart';
import 'package:shop_flow/features/onboard/presentation/views/onboard_view.dart';
import 'package:shop_flow/features/profile/presentation/views/favorites_view.dart';
import 'package:shop_flow/main_view.dart';

Route<dynamic> onGeneratedRoute(RouteSettings settings) {
  switch (settings.name) {
    case OnboardView.id:
      return MaterialPageRoute(builder: (context) => OnboardView());
    case SigninView.id:
      return MaterialPageRoute(builder: (context) => SigninView());
    case SignupView.id:
      return MaterialPageRoute(builder: (context) => SignupView());
    case MainView.id:
      return MaterialPageRoute(builder: (context) => MainView());
    case CategoriesSearchView.id:
      return MaterialPageRoute(builder: (context) => CategoriesSearchView());
    case CategoryDetailsView.id:
      final model = settings.arguments as CategoryModel;
      return MaterialPageRoute(
          builder: (context) => CategoryDetailsView(
                model: model,
              ));
    case ProductDetailsView.id:
      final productEntity = settings.arguments as ProductEntity;
      return MaterialPageRoute(
          builder: (context) => ProductDetailsView(
                productEntity: productEntity,
              ));
    case TopSellingAndNewInDetailsView.id:
      final model = settings.arguments as TopSellingNewInModel;
      return MaterialPageRoute(
          builder: (context) => TopSellingAndNewInDetailsView(
                model: model,
              ));
    case CartView.id:
      return MaterialPageRoute(builder: (context) => CartView());
    case CheckoutView.id:
    final total = settings.arguments as double;
      return MaterialPageRoute(builder: (context) => CheckoutView(total: total,));
    case FavoritesView.id:
      return MaterialPageRoute(builder: (context) => FavoritesView());
    default:
      return MaterialPageRoute(builder: (context) => Scaffold());
  }
}
