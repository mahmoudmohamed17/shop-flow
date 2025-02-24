import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shop_flow/constants.dart';
import 'package:shop_flow/core/services/shared_prefs.dart';
import 'package:shop_flow/core/utils/app_styles.dart';
import 'package:shop_flow/core/utils/assets.dart';
import 'package:shop_flow/core/widgets/custom_button.dart';
import 'package:shop_flow/core/widgets/custom_password_text_form_field.dart';
import 'package:shop_flow/core/widgets/custom_text_form_field.dart';
import 'package:shop_flow/features/auth/presentation/manager/signup_cubit/signup_cubit.dart';
import 'package:shop_flow/features/auth/presentation/widgets/image_picking_widget.dart';

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
                ImagePickingWidget(
                  onTap: (value) {
                    image = value;
                  },
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
                          var users =
                              FirebaseFirestore.instance.collection(userData);
                          await users.add({
                            'username': name,
                            'email': email,
                            'password': password,
                            'profileImage': image,
                            'phoneNumber': phoneNumber,
                          }).then((value) async {
                            await SharedPrefs.setString(userDocRefId, value.id);
                          });
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
