import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shop_flow/core/funcs/add_data_to_firestore.dart';
import 'package:shop_flow/core/utils/app_styles.dart';
import 'package:shop_flow/core/utils/assets.dart';
import 'package:shop_flow/core/utils/user_data_manager.dart';
import 'package:shop_flow/core/widgets/custom_button.dart';
import 'package:shop_flow/core/widgets/custom_password_text_form_field.dart';
import 'package:shop_flow/core/widgets/custom_text_form_field.dart';
import 'package:shop_flow/features/auth/presentation/manager/signup_cubit/signup_cubit.dart';
import 'package:shop_flow/features/auth/presentation/widgets/image_picking_widget.dart';
import 'package:shop_flow/features/home/data/models/firestore_user_data.dart';

class SignupViewBody extends StatefulWidget {
  const SignupViewBody({super.key});

  @override
  State<SignupViewBody> createState() => _SignupViewBodyState();
}

class _SignupViewBodyState extends State<SignupViewBody> {
  late String email, password, name, phoneNumber, image;
  late GlobalKey<FormState> formKey;
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  @override
  void initState() {
    formKey = GlobalKey<FormState>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 16,
              children: [
                SizedBox(),
                GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: SvgPicture.asset(Assets.imagesBackgroundArrowBack)),
                Text(
                  'Create Account',
                  style: AppStyles.bold32,
                ),
                Align(
                  alignment: Alignment.center,
                  child: ImagePickingWidget(
                    onTap: (value) {
                      image = value;
                    },
                  ),
                ),
                SizedBox(
                  height: 2,
                ),
                CustomTextField(
                  hintText: 'Name',
                  onChanged: (value) async {
                    name = value;
                  },
                ),
                CustomTextField(
                  hintText: 'Phone Number',
                  textInputType: TextInputType.number,
                  onChanged: (value) async {
                    phoneNumber = value;
                  },
                ),
                CustomTextField(
                  hintText: 'Email Address',
                  onChanged: (value) async {
                    email = value;
                  },
                ),
                CustomPasswordTextFormField(
                  hintText: 'Password',
                  onChanged: (value) {
                    password = value;
                  },
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Expanded(
                        child: CustomButton(
                      label: 'Continue',
                      onPressed: () async {
                        if (formKey.currentState!.validate()) {
                          formKey.currentState!.save();
                          context
                              .read<SignupCubit>()
                              .signUp(email: email, password: password);
                          await addDataToFirestore(FirestoreUserData(
                              email: email,
                              password: password,
                              phoneNumber: phoneNumber,
                              profileImage: image,
                              username: name));
                          await UserDataManager.getUserData();
                        } else {
                          setState(() {
                            autovalidateMode = AutovalidateMode.always;
                          });
                        }
                      },
                    )),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
              ],
            ),
          )),
    );
  }
}
