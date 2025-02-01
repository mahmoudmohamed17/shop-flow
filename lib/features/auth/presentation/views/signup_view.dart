import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:shop_flow/constants.dart';
import 'package:shop_flow/core/funcs/build_snack_bar.dart';
import 'package:shop_flow/core/funcs/get_it_service.dart';
import 'package:shop_flow/core/services/shared_prefs.dart';
import 'package:shop_flow/features/auth/domain/repositories/auth_repo.dart';
import 'package:shop_flow/features/auth/presentation/manager/signup_cubit/signup_cubit.dart';
import 'package:shop_flow/features/auth/presentation/widgets/signup_view_body.dart';
import 'package:shop_flow/main_view.dart';

class SignupView extends StatelessWidget {
  const SignupView({super.key});
  static const String id = 'signup_view';
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignupCubit(getIt<AuthRepo>()),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: BlocConsumer<SignupCubit, SignupState>(
          listener: (context, state) {
            if (state is SignupFailure) {
              buildSnackBar(context, state.message);
            }
            if (state is SignupSuccess) {
              buildSnackBar(context, 'Account created successfully!');
              SharedPrefs.setBool(isLoggedInOrSignedUp, true);
              Navigator.pushReplacementNamed(context, MainView.id);
            }
          },
          builder: (context, state) {
            return ModalProgressHUD(
                inAsyncCall: state is SignupLoading, child: SignupViewBody());
          },
        ),
      ),
    );
  }
}
