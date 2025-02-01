import 'package:flutter/material.dart';
import 'package:shop_flow/features/profile/data/models/user_setting_option_model.dart';
import 'package:shop_flow/features/profile/presentation/views/favorites_view.dart';
import 'package:shop_flow/features/profile/presentation/widgets/setting_option_widget.dart';

class UserSettingsOptionsWidgt extends StatelessWidget {
  const UserSettingsOptionsWidgt({super.key});
  static List<UserSettingOptionModel> options(BuildContext context) => [
        UserSettingOptionModel(label: 'Address', onTap: () {}),
        UserSettingOptionModel(
            label: 'Favorites',
            onTap: () {
              Navigator.pushNamed(context, FavoritesView.id);
            }),
        UserSettingOptionModel(label: 'Payment', onTap: () {}),
        UserSettingOptionModel(label: 'Help', onTap: () {}),
        UserSettingOptionModel(label: 'Support', onTap: () {}),
      ];
  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 8,
      children: List.generate(options(context).length, (index) {
        return SettingOptionWidget(
          model: options(context)[index],
        );
      }),
    );
  }
}
