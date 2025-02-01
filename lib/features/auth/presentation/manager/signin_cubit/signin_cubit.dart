import 'package:bloc/bloc.dart';
import 'package:shop_flow/features/auth/domain/entities/user_entity.dart';
import 'package:shop_flow/features/auth/domain/repositories/auth_repo.dart';

part 'signin_state.dart';

class SigninCubit extends Cubit<SigninState> {
  SigninCubit(this.authRepo) : super(SigninInitial());
  final AuthRepo authRepo;
  late UserEntity userEntity;
  Future<void> signIn({required String email, required String password}) async {
    emit(SigninLoading());
    var result = await authRepo.signIn(email: email, password: password);
    result.fold((failure) {
      emit(SigninFailure(message: failure.message));
    }, (user) {
      userEntity = user;
      emit(SigninSuccess(userEntity: user));
    });
  }
}
