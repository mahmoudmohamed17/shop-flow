import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_flow/core/utils/app_styles.dart';
import 'package:shop_flow/core/utils/assets.dart';
import 'package:shop_flow/core/widgets/custom_button.dart';
import 'package:shop_flow/core/widgets/custom_password_text_form_field.dart';
import 'package:shop_flow/core/widgets/custom_text_form_field.dart';
import 'package:shop_flow/features/auth/presentation/manager/signin_cubit/signin_cubit.dart';
import 'package:shop_flow/features/auth/presentation/views/signup_view.dart';
import 'package:shop_flow/features/auth/presentation/widgets/ask_about_user.dart';
import 'package:shop_flow/features/auth/presentation/widgets/social_login_button.dart';

class SigninViewBody extends StatefulWidget {
  const SigninViewBody({super.key});

  @override
  State<SigninViewBody> createState() => _SigninViewBodyState();
}

class _SigninViewBodyState extends State<SigninViewBody> {
  late String email, password;
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
      child: Center(
        child: SingleChildScrollView(
          padding: EdgeInsetsDirectional.symmetric(horizontal: 25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 16,
            children: [
              Text(
                'Sign in',
                style: AppStyles.bold32,
              ),
              SizedBox(
                height: 20,
              ),
              CustomTextField(
                hintText: 'Email Address',
                onChanged: (value) {
                  email = value;
                },
              ),
              CustomPasswordTextFormField(
                hintText: 'Password',
                onChanged: (value) {
                  password = value;
                },
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: CustomButton(
                      label: 'Continue',
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          formKey.currentState!.save();
                          context
                              .read<SigninCubit>()
                              .signIn(email: email, password: password);
                        } else {
                          setState(() {
                            autovalidateMode = AutovalidateMode.always;
                          });
                        }
                      },
                    ),
                  ),
                ],
              ),
              AskAboutUser(
                firstLabel: 'Don\'t have an Account?',
                secondLabel: 'Create One',
                onTap: () {
                  Navigator.pushNamed(context, SignupView.id);
                },
              ),
              SizedBox(
                height: 45,
              ),
              SocialLoginButton(
                onPressed: () {},
                label: 'Continue with Apple',
                icon: Assets.imagesApple,
              ),
              SocialLoginButton(
                onPressed: () {},
                label: 'Continue with Google',
                icon: Assets.imagesGoogle,
              ),
              SocialLoginButton(
                onPressed: () {},
                label: 'Continue with Facebook',
                icon: Assets.imagesFacebook,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
