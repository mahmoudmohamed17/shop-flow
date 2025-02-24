import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:shop_flow/constants.dart';
import 'package:shop_flow/core/funcs/snack_bar.dart';
import 'package:shop_flow/core/funcs/get_it_service.dart';
import 'package:shop_flow/core/services/shared_prefs.dart';
import 'package:shop_flow/features/auth/domain/repositories/auth_repo.dart';
import 'package:shop_flow/features/auth/presentation/manager/signin_cubit/signin_cubit.dart';
import 'package:shop_flow/features/auth/presentation/widgets/signin_view_body.dart';
import 'package:shop_flow/main_view.dart';

class SigninView extends StatelessWidget {
  const SigninView({super.key});
  static const String id = 'signin_view';
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SigninCubit(getIt<AuthRepo>()),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: BlocConsumer<SigninCubit, SigninState>(
          listener: (context, state) {
            if (state is SigninFailure) {
              snackBar(context, state.message);
            }
            if (state is SigninSuccess) {
              Navigator.pushReplacementNamed(context, MainView.id);
              snackBar(context, 'Successfully signed in!');
              SharedPrefs.setBool(isLoggedInOrSignedUp, true);
            }
          },
          builder: (context, state) {
            return ModalProgressHUD(
                inAsyncCall: state is SigninLoading, child: SigninViewBody());
          },
        ),
      ),
    );
  }
}
