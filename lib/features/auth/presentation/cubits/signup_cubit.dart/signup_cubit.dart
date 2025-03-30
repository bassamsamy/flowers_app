import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/models/result.dart';
import '../../../domain/use_cases/login_use_case.dart';
import '../login_cubit/login_cubit.dart';

class SignupCubit extends Cubit<LoginState> {
  final LoginUseCase _signupUseCase;

  SignupCubit(this._signupUseCase) : super(LoginInitial());
  static SignupCubit get(context) => BlocProvider.of(context);

  Future<void> signup(String email, String password) async {
    emit(LoginLoading());
    final result = await _signupUseCase(email, password);
    switch (result) {
      case Success():
        emit(LoginSuccess());
      case Error():
        emit(LoginFailure(result.exception.toString()));
    }
  }

  void checkBoxPressed() {
    emit(LoginCheckBoxPressed());
  }
}
