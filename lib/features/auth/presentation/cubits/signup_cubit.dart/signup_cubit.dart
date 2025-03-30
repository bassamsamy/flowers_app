import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/models/result.dart';
import '../../../domain/use_cases/login_use_case.dart';
import 'signup_state.dart';

class SignupCubit extends Cubit<SignupState> {
  final LoginUseCase _signupUseCase;

  SignupCubit(this._signupUseCase) : super(SignupInitial());
  static SignupCubit get(context) => BlocProvider.of(context);

  Future<void> signup(String email, String password) async {
    emit(SignupLoading()); // Emit SignupLoading instead of LoginLoading
    final result = await _signupUseCase(email, password);
    switch (result) {
      case Success():
        emit(SignupSuccess());
      case Error():
        emit(SignupFailure(result.exception?.toString() ??
            "An unexpected error occurred. Please try again."));
    }
  }

  void checkBoxPressed() {
    emit(SignupCheckBoxPressed());
  }
}
