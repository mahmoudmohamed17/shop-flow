import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import 'package:shop_flow/core/funcs/get_it_service.dart';
import 'package:shop_flow/core/utils/app_colors.dart';
import 'package:shop_flow/core/utils/assets.dart';
import 'package:shop_flow/features/home/domain/repositories/home_repo.dart';
import 'package:shop_flow/features/home/presentation/manager/favorites_cubit/favorites_cubit.dart';
import 'package:shop_flow/features/home/presentation/manager/products_cubit/products_cubit.dart';
import 'package:shop_flow/features/home/presentation/widgets/home_view_body.dart';
import 'package:shop_flow/features/home/presentation/widgets/notifications_view_body.dart';
import 'package:shop_flow/features/orders/presentation/widgets/orders_view_body.dart';
import 'package:shop_flow/features/profile/presentation/widgets/profile_view_body.dart';

class MainView extends StatefulWidget {
  const MainView({super.key});
  static const String id = 'main_view';
  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  int currentIndex = 0;
  final List<Widget> pages = [
    BlocProvider(
      create: (context) => ProductsCubit(getIt<HomeRepo>()),
      child: HomeViewBody(),
    ),
    NotificationsViewBody(),
    OrdersViewBody(),
    ProfileViewBody(),
  ];
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavoritesCubit, FavoritesState>(
      builder: (context, state) {
        return Scaffold(
          body: IndexedStack(
            index: currentIndex,
            children: pages,
          ),
          bottomNavigationBar: SalomonBottomBar(
            currentIndex: currentIndex,
            onTap: (index) {
              setState(() {
                currentIndex = index;
              });
            },
            items: [
              SalomonBottomBarItem(
                icon: SvgPicture.asset(Assets.imagesHome),
                activeIcon: SvgPicture.asset(
                  Assets.imagesHome,
                  colorFilter:
                      ColorFilter.mode(AppColors.primaryColor, BlendMode.srcIn),
                ),
                title: Text('Home'),
                selectedColor: AppColors.primaryColor,
              ),
              SalomonBottomBarItem(
                icon: SvgPicture.asset(Assets.imagesNotificationBing),
                activeIcon: SvgPicture.asset(
                  Assets.imagesNotificationBing,
                  colorFilter:
                      ColorFilter.mode(AppColors.primaryColor, BlendMode.srcIn),
                ),
                title: Text('Notification'),
                selectedColor: AppColors.primaryColor,
              ),
              SalomonBottomBarItem(
                icon: SvgPicture.asset(Assets.imagesReceipt),
                activeIcon: SvgPicture.asset(
                  Assets.imagesReceipt,
                  colorFilter:
                      ColorFilter.mode(AppColors.primaryColor, BlendMode.srcIn),
                ),
                title: Text('Receipt'),
                selectedColor: AppColors.primaryColor,
              ),
              SalomonBottomBarItem(
                icon: SvgPicture.asset(Assets.imagesProfile),
                activeIcon: SvgPicture.asset(
                  Assets.imagesProfile,
                  colorFilter:
                      ColorFilter.mode(AppColors.primaryColor, BlendMode.srcIn),
                ),
                title: Text('Profile'),
                selectedColor: AppColors.primaryColor,
              ),
            ],
          ),
        );
      },
    );
  }
}
