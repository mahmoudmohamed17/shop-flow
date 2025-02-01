import 'package:bloc/bloc.dart';
import 'package:shop_flow/features/auth/domain/entities/user_entity.dart';
import 'package:shop_flow/features/auth/domain/repositories/auth_repo.dart';

part 'signup_state.dart';

class SignupCubit extends Cubit<SignupState> {
  SignupCubit(this.authRepo) : super(SignupInitial());
  final AuthRepo authRepo;
  Future<void> signUp({required String email, required String password}) async {
    emit(SignupLoading());
    var result = await authRepo.signUp(email: email, password: password);
    result.fold((failure) {
      emit(SignupFailure(message: failure.message));
    }, (user) {
      emit(SignupSuccess(userEntity: user));
    });
  }
}
