import 'package:flutter/material.dart';
import 'package:shop_flow/core/utils/app_styles.dart';
import 'package:shop_flow/core/widgets/custom_button.dart';
import 'package:shop_flow/core/widgets/custom_text_form_field.dart';

Future<dynamic> saveCheckoutItemData(BuildContext context,
    {required String title, required VoidCallback onTap}) {
  return showModalBottomSheet(
      context: context,
      builder: (context) {
        // late String data;
        return Padding(
          padding: EdgeInsets.only(
            top: 16,
            right: 16,
            left: 16,
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Expanded(child: SizedBox()),
                    Text(
                      title,
                      style: AppStyles.regular16,
                    ),
                    Expanded(child: SizedBox()),
                  ],
                ),
                SizedBox(
                  height: 16,
                ),
                CustomTextField(
                  hintText: 'e.g. Egypt, Cairo',
                  onChanged: (value) {
                    // data = value;
                  },
                ),
                SizedBox(
                  height: 16,
                ),
                CustomButton(
                  label: 'Save',
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                SizedBox(
                  height: 16,
                ),
              ],
            ),
          ),
        );
      });
}
